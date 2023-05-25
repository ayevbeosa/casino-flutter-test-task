import 'package:casino_test/core/converters/character_converter.dart';
import 'package:casino_test/core/error/server_exception.dart';
import 'package:casino_test/core/network/network_info.dart';
import 'package:casino_test/core/typedefs/typedefs.dart';
import 'package:casino_test/features/characters/data/datasources/characters_remote_data_source.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:casino_test/features/characters/domain/repositories/characters_repository.dart';
import 'package:fpdart/fpdart.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersRemoteDataSource remoteDataSource;
  final CharacterConverter characterConverter;
  final NetworkInfo networkInfo;

  CharactersRepositoryImpl({
    required this.remoteDataSource,
    required this.characterConverter,
    required this.networkInfo,
  });

  @override
  FutureEither<PaginatedCharacter> getCharacters(int pageNo) async {
    final networkStatus = await networkInfo.isConnected;
    if (networkStatus) {
      try {
        final remoteData = await remoteDataSource.getCharacters(pageNo);
        return Right(characterConverter.toPaginatedCharacter(remoteData));
      } on ServerException catch (e) {
        return Left(e);
      } catch (e) {
        return Left(ServerException.handleError(e));
      }
    } else {
      return Left(
        ServerException(message: 'No internet connection', statusCode: null),
      );
    }
  }
}
