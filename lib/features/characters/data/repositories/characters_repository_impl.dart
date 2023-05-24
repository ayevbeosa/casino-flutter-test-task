import 'package:casino_test/core/converters/character_converter.dart';
import 'package:casino_test/core/error/server_exception.dart';
import 'package:casino_test/core/typedefs/typedefs.dart';
import 'package:casino_test/features/characters/data/datasources/characters_remote_data_source.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:casino_test/features/characters/domain/repositories/characters_repository.dart';
import 'package:fpdart/fpdart.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersRemoteDataSource remoteDataSource;
  final CharacterConverter characterConverter;

  CharactersRepositoryImpl({
    required this.remoteDataSource,
    required this.characterConverter,
  });

  @override
  FutureEither<PaginatedCharacter> getCharacters(int pageNo) async {
    try {
      final remoteData = await remoteDataSource.getCharacters(pageNo);
      return Right(characterConverter.toPaginatedCharacter(remoteData));
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException.handleError(e));
    }
  }
}
