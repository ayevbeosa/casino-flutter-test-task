import 'package:bloc_test/bloc_test.dart';
import 'package:casino_test/core/error/failure.dart';
import 'package:casino_test/core/usecases/use_case.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:casino_test/features/characters/domain/usecases/get_characters_use_case.dart';
import 'package:casino_test/features/characters/presentation/bloc/character_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCharactersUseCase extends Mock implements GetCharactersUseCase {}

class FakeNoParams extends Fake implements NoParams {}

void main() {
  late CharacterBloc bloc;
  late MockGetCharactersUseCase mockGetCharactersUseCase;

  setUp(() {
    mockGetCharactersUseCase = MockGetCharactersUseCase();
    bloc = CharacterBloc(mockGetCharactersUseCase);
    registerFallbackValue(FakeNoParams());
  });

  final character = Character(
    id: 361,
    name: 'Toxic Rick',
    image: 'https://rickandmortyapi.com/api/character/avatar/361.jpeg',
  );

  test('initialState should be [Initial]', () {
    // assert
    expect(bloc.state, equals(Initial()));
  });

  group('checks bloc states', () {
    blocTest<CharacterBloc, CharacterState>(
      'emits loading',
      build: () => bloc,
      act: (bloc) {
        bloc.emit(Loading());
      },
      expect: () => <CharacterState>[
        Loading(),
      ],
    );

    blocTest<CharacterBloc, CharacterState>(
      'emits success state',
      build: () => bloc,
      act: (bloc) {
        bloc.emit(Success(character));
      },
      expect: () => <CharacterState>[
        Success(character),
      ],
    );

    blocTest<CharacterBloc, CharacterState>(
      'emits error state',
      build: () => bloc,
      act: (bloc) {
        bloc.emit(Error('An error occurred'));
      },
      expect: () => <CharacterState>[
        Error('An error occurred'),
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
      bloc.add(GetCharacters());
    },
    expect: () => <CharacterState>[
      Loading(),
      Error('An error occurred'),
    ],
  );

  blocTest<CharacterBloc, CharacterState>(
    'should emit [Loading, Success] for successful data fetch',
    build: () => bloc,
    setUp: () {
      when(() => mockGetCharactersUseCase(any()))
          .thenAnswer((_) async => Right(character));
    },
    act: (bloc) {
      bloc.add(GetCharacters());
    },
    expect: () => <CharacterState>[
      Loading(),
      Success(character),
    ],
  );
}
