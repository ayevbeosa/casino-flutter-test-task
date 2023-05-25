import 'package:casino_test/core/converters/character_converter.dart';
import 'package:casino_test/core/error/server_exception.dart';
import 'package:casino_test/core/network/network_info.dart';
import 'package:casino_test/features/characters/data/datasources/characters_remote_data_source.dart';
import 'package:casino_test/features/characters/data/models/character_model.dart';
import 'package:casino_test/features/characters/data/repositories/characters_repository_impl.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements CharactersRemoteDataSource {}

class MockCharacterConverter extends Mock implements CharacterConverter {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late CharactersRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockCharacterConverter mockCharacterConverter;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockCharacterConverter = MockCharacterConverter();
    mockNetworkInfo = MockNetworkInfo();

    repository = CharactersRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      characterConverter: mockCharacterConverter,
      networkInfo: mockNetworkInfo,
    );
  });

  int pageNo = 1;

  const characterModel = CharacterModel(
    id: 361,
    name: 'Toxic Rick',
    image: 'https://rickandmortyapi.com/api/character/avatar/361.jpeg',
    status: 'Dead',
    species: 'Humanoid',
    gender: 'Male',
    location: LocationModel(
      name: 'Earth',
      url: 'https://rickandmortyapi.com/api/location/20',
    ),
    episode: ['https://rickandmortyapi.com/api/episode/27'],
  );

  const paginatedCharacterModel = PaginatedCharacterModel(
    info: PaginationInfoModel(count: 23, pages: 2, prev: null, next: ''),
    results: [characterModel],
  );

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

  test(
    'should return remote data when the call to remote data source is successful',
    () async {
      when(() => mockCharacterConverter.toPaginatedCharacter(
          paginatedCharacterModel)).thenAnswer((_) => paginatedCharacter);

      when(() => mockRemoteDataSource.getCharacters(pageNo))
          .thenAnswer((_) async => paginatedCharacterModel);

      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      final result = await repository.getCharacters(pageNo);

      verify(() => mockRemoteDataSource.getCharacters(pageNo));
      expect(
        result,
        equals(Right(mockCharacterConverter
            .toPaginatedCharacter(paginatedCharacterModel))),
      );
    },
  );

  test(
    'should return server failure when the call to remote data source is unsuccessful',
    () async {
      when(() => mockRemoteDataSource.getCharacters(pageNo))
          .thenThrow(ServerException(statusCode: 500));

      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      final result = await repository.getCharacters(pageNo);

      verify(() => mockRemoteDataSource.getCharacters(pageNo));

      expect(
        result,
        equals(Left(ServerException(statusCode: 500))),
      );
    },
  );

  test(
    'should return no internet connection when device is offline',
    () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      final result = await repository.getCharacters(pageNo);

      verifyZeroInteractions(mockRemoteDataSource);

      expect(
          result,
          equals(Left(ServerException(
              message: 'No internet connection', statusCode: null))));
    },
  );
}
