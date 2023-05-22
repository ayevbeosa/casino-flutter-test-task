import 'package:casino_test/core/typedefs/typedefs.dart';
import 'package:casino_test/core/usecases/use_case.dart';
import 'package:casino_test/features/domain/entities/character.dart';
import 'package:casino_test/features/domain/repositories/characters_repository.dart';

class GetCharacters extends UseCase<Character, NoParams> {
  final CharactersRepository repository;

  GetCharacters(this.repository);

  FutureEither<Character> call(NoParams noParams) async {
    return await repository.getCharacters();
  }
}
