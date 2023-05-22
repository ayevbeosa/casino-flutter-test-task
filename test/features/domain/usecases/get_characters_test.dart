import 'package:casino_test/core/usecases/use_case.dart';
import 'package:casino_test/features/domain/entities/character.dart';
import 'package:casino_test/features/domain/repositories/characters_repository.dart';
import 'package:casino_test/features/domain/usecases/get_characters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterRepository extends Mock implements CharactersRepository {}

void main() {
  late GetCharacters usecase;
  late MockCharacterRepository mockCharacterRepository;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    usecase = GetCharacters(mockCharacterRepository);
  });

  final character = Character(id: 1, name: 'Rick', image: 'img-url');

  test(
    'should get characters from the repository',
    () async {
      when(() => mockCharacterRepository.getCharacters())
          .thenAnswer((_) async => Right(character));

      final result = await usecase(NoParams());

      expect(result, Right(character));
      verify(() => mockCharacterRepository.getCharacters());
      verifyNoMoreInteractions(mockCharacterRepository);
    },
  );
}
