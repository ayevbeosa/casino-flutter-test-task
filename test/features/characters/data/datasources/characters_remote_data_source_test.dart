import 'package:casino_test/core/error/server_exception.dart';
import 'package:casino_test/core/network/endpoint.dart';
import 'package:casino_test/features/characters/data/datasources/characters_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  late CharactersRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = CharactersRemoteDataSourceImpl(client: mockHttpClient);
    registerFallbackValue(FakeUri());
  });

  int pageNo = 1;

  test(
    'should preform a GET request on a URL with application/json header',
    () {
      when(() => mockHttpClient.get(
            any(),
            headers: any(named: 'headers'),
          )).thenAnswer(
        (_) async => http.Response(fixture('character.json'), 200),
      );

      dataSource.getCharacters(pageNo);

      verify(
        () => mockHttpClient.get(
          Uri.parse(Endpoint.characters(pageNo)),
          headers: {'Content-Type': 'application/json'},
        ),
      );
    },
  );

  test(
    'should throw a ServerException when the response code is 404 or other',
    () async {
      when(() => mockHttpClient.get(
            any(),
            headers: any(named: 'headers'),
          )).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );

      final call = dataSource.getCharacters;
      expect(() => call(pageNo), throwsA(const TypeMatcher<ServerException>()));
    },
  );
}
