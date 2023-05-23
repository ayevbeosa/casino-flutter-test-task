import 'package:bloc_test/bloc_test.dart';
import 'package:casino_test/core/error/failure.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:casino_test/features/characters/domain/usecases/get_characters_use_case.dart';
import 'package:casino_test/features/characters/presentation/bloc/character_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCharactersUseCase extends Mock implements GetCharactersUseCase {}

class FakeParams extends Fake implements Params {}

void main() {
  late CharacterBloc bloc;
  late MockGetCharactersUseCase mockGetCharactersUseCase;

  setUp(() {
    mockGetCharactersUseCase = MockGetCharactersUseCase();
    bloc = CharacterBloc(mockGetCharactersUseCase);
    registerFallbackValue(FakeParams());
  });

  const character = Character(
    id: 361,
    name: 'Toxic Rick',
    image: 'https://rickandmortyapi.com/api/character/avatar/361.jpeg',
  );
  const paginatedCharacter = PaginatedCharacter(
    info: PaginationInfo(count: 23, pages: 2, prev: null, next: ''),
    results: [character],
  );

  test('initialState should be [Initial]', () {
    // assert
    expect(bloc.state.status, equals(CharacterStatus.initial));
  });

  group('checks bloc states', () {
    blocTest<CharacterBloc, CharacterState>(
      'emits loading',
      build: () => bloc,
      act: (bloc) {
        bloc.emit(const CharacterState(status: CharacterStatus.loading));
      },
      expect: () => <CharacterState>[
        const CharacterState(status: CharacterStatus.loading),
      ],
    );

    blocTest<CharacterBloc, CharacterState>(
      'emits success state',
      build: () => bloc,
      act: (bloc) {
        bloc.emit(CharacterState(
          status: CharacterStatus.success,
          characters: paginatedCharacter.results,
        ));
      },
      expect: () => <CharacterState>[
        CharacterState(
          status: CharacterStatus.success,
          characters: paginatedCharacter.results,
        ),
      ],
    );

    blocTest<CharacterBloc, CharacterState>(
      'emits error state',
      build: () => bloc,
      act: (bloc) {
        bloc.emit(const CharacterState(
          status: CharacterStatus.error,
          errorMessage: 'An error occurred',
        ));
      },
      expect: () => <CharacterState>[
        const CharacterState(
          status: CharacterStatus.error,
          errorMessage: 'An error occurred',
        ),
      ],
    );
  });

  blocTest<CharacterBloc, CharacterState>(
    'should emit [Loading, Error] with a message for the error when getting data fails',
    build: () => bloc,
    setUp: () {
      when(() => mockGetCharactersUseCase(any()))
          .thenAnswer((_) async => Left(ServerFailure()));
    },
    act: (bloc) {
      bloc.add(const GetCharacters());
    },
    expect: () => <CharacterState>[
      const CharacterState(
        status: CharacterStatus.loading,
      ),
      const CharacterState(
        status: CharacterStatus.error,
        errorMessage: 'An error occurred',
      ),
    ],
  );

  blocTest<CharacterBloc, CharacterState>(
    'should emit [Loading, Success] for successful data fetch',
    build: () => bloc,
    setUp: () {
      when(() => mockGetCharactersUseCase(any()))
          .thenAnswer((_) async => const Right(paginatedCharacter));
    },
    act: (bloc) {
      bloc.add(const GetCharacters());
    },
    expect: () => <CharacterState>[
      const CharacterState(
        status: CharacterStatus.loading,
      ),
      CharacterState(
        status: CharacterStatus.success,
        characters: paginatedCharacter.results,
      ),
    ],
  );
}
