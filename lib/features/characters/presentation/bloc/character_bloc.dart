import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:casino_test/features/characters/domain/usecases/get_characters_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'character_event.dart';
part 'character_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharactersUseCase _getCharactersUseCase;

  int currentPageNo = 1;

  CharacterBloc(this._getCharactersUseCase) : super(const CharacterState()) {
    on<GetCharacters>(
      _onGetCharacters,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onGetCharacters(
    GetCharacters event,
    Emitter<CharacterState> emit,
  ) async {
    if (state.hasReachedMax) return;

    emit(state.copyWith(status: CharacterStatus.loading));

    if (state.status == CharacterStatus.initial) {
      final result = await _getCharactersUseCase(Params(pageNo: currentPageNo));

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: CharacterStatus.error,
            errorMessage: 'An error occurred',
          ),
        ),
        (paginatedCharacter) {
          emit(
            state.copyWith(
              status: CharacterStatus.success,
              characters: paginatedCharacter.results,
              hasReachedMax: false,
            ),
          );
          currentPageNo++;
        },
      );
    }

    final result = await _getCharactersUseCase(Params(pageNo: currentPageNo));

    result.fold(
      (failure) => emit(state.copyWith(
        status: CharacterStatus.error,
        errorMessage: 'An error occurred',
      )),
      (paginatedCharacter) => emit(
        paginatedCharacter.info.next == null
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: CharacterStatus.success,
                characters: List.of(state.characters)
                  ..addAll(paginatedCharacter.results),
                hasReachedMax: false,
              ),
      ),
    );
  }
}
