import 'package:bloc/bloc.dart';
import 'package:casino_test/core/usecases/use_case.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:casino_test/features/characters/domain/usecases/get_characters_use_case.dart';
import 'package:equatable/equatable.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharactersUseCase _getCharactersUseCase;

  CharacterBloc(this._getCharactersUseCase) : super(Initial()) {
    on<GetCharacters>(_onGetCharacters);
  }

  Future<void> _onGetCharacters(
    GetCharacters event,
    Emitter<CharacterState> emit,
  ) async {
    emit(Loading());

    final result = await _getCharactersUseCase(NoParams());

    result.fold(
      (failure) => emit(Error('An error occurred')),
      (characters) => emit(Success(characters)),
    );
  }
}
