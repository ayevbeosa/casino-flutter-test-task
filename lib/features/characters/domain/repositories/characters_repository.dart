import 'package:casino_test/core/typedefs/typedefs.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';

abstract class CharactersRepository {
  FutureEither<Character> getCharacters();
}
