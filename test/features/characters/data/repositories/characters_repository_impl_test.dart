import 'package:casino_test/core/error/failure.dart';
import 'package:casino_test/core/error/server_exception.dart';
import 'package:casino_test/features/characters/data/datasources/characters_remote_data_source.dart';
import 'package:casino_test/features/characters/data/models/character_model.dart';
import 'package:casino_test/features/characters/data/repositories/characters_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements CharactersRemoteDataSource {}

void main() {
  late CharactersRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = CharactersRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  final characterModel = CharacterModel(
    id: 361,
    name: 'Toxic Rick',
    image: 'https://rickandmortyapi.com/api/character/avatar/361.jpeg',
  );

  test(
    'should return remote data when the call to remote data source is successful',
    () async {
      when(() => mockRemoteDataSource.getCharacters())
          .thenAnswer((_) async => characterModel);

      final result = await repository.getCharacters();

      verify(() => mockRemoteDataSource.getCharacters());
      expect(result, equals(Right(characterModel)));
    },
  );

  test(
    'should return server failure when the call to remote data source is unsuccessful',
    () async {
      when(() => mockRemoteDataSource.getCharacters())
          .thenThrow(ServerException());

      final result = await repository.getCharacters();

      verify(() => mockRemoteDataSource.getCharacters());

      expect(result, equals(Left(ServerFailure())));
    },
  );
}
