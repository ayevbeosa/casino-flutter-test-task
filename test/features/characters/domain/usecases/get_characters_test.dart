import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:casino_test/features/characters/domain/repositories/characters_repository.dart';
import 'package:casino_test/features/characters/domain/usecases/get_characters_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterRepository extends Mock implements CharactersRepository {}

void main() {
  late GetCharactersUseCase usecase;
  late MockCharacterRepository mockCharacterRepository;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    usecase = GetCharactersUseCase(mockCharacterRepository);
  });

  const character = Character(
    id: 361,
    name: 'Toxic Rick',
    image: 'https://rickandmortyapi.com/api/character/avatar/361.jpeg',
    status: 'Dead',
    species: 'Humanoid',
    gender: 'Male',
    location: Location(
      name: 'Earth',
      url: 'https://rickandmortyapi.com/api/location/20',
    ),
    episode: ['https://rickandmortyapi.com/api/episode/27'],
  );

  const paginatedCharacter = PaginatedCharacter(
    info: PaginationInfo(count: 23, pages: 2, prev: null, next: ''),
    results: [character],
  );

  int pageNo = 1;

  test(
    'should get characters from the repository',
    () async {
      when(() => mockCharacterRepository.getCharacters(pageNo))
          .thenAnswer((_) async => const Right(paginatedCharacter));

      final result = await usecase(Params(pageNo: pageNo));

      expect(result, const Right(paginatedCharacter));
      verify(() => mockCharacterRepository.getCharacters(pageNo));
      verifyNoMoreInteractions(mockCharacterRepository);
    },
  );
}
