import 'package:casino_test/core/error/failure.dart';
import 'package:casino_test/core/error/server_exception.dart';
import 'package:casino_test/core/typedefs/typedefs.dart';
import 'package:casino_test/features/data/datasources/characters_remote_data_source.dart';
import 'package:casino_test/features/domain/entities/character.dart';
import 'package:casino_test/features/domain/repositories/characters_repository.dart';
import 'package:fpdart/fpdart.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersRemoteDataSource remoteDataSource;

  CharactersRepositoryImpl({required this.remoteDataSource});

  @override
  FutureEither<Character> getCharacters() async {
    try {
      final remoteCharacters = await remoteDataSource.getCharacters();
      return Right(remoteCharacters);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }
}
