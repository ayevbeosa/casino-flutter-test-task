import 'package:casino_test/core/typedefs/typedefs.dart';
import 'package:casino_test/core/usecases/use_case.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:casino_test/features/characters/domain/repositories/characters_repository.dart';

class GetCharactersUseCase extends UseCase<Character, NoParams> {
  final CharactersRepository repository;

  GetCharactersUseCase(this.repository);

  FutureEither<Character> call(NoParams noParams) async {
    return await repository.getCharacters();
  }
}
