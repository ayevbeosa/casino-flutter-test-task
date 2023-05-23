import 'dart:convert';

import 'package:casino_test/features/characters/data/models/character_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const characterModel = CharacterModel(
    id: 361,
    name: 'Toxic Rick',
    image: 'https://rickandmortyapi.com/api/character/avatar/361.jpeg',
  );

  const paginatedCharacterModel = PaginatedCharacterModel(
    info: PaginationInfoModel(
      count: 826,
      pages: 42,
      next: 'https://rickandmortyapi.com/api/character/?page=20',
      prev: 'https://rickandmortyapi.com/api/character/?page=18',
    ),
    results: [characterModel],
  );

  group('fromJson', () {
    test(
      'should return a valid model from the JSON file',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(
          fixture('character.json'),
        );

        final result = PaginatedCharacterModel.fromJson(jsonMap);
        expect(result, paginatedCharacterModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = paginatedCharacterModel.toJson();

        final expectedJsonMap = {
          'info': {
            'count': 826,
            'pages': 42,
            'next': 'https://rickandmortyapi.com/api/character/?page=20',
            'prev': 'https://rickandmortyapi.com/api/character/?page=18'
          },
          'results': [
            {
              'id': 361,
              'name': 'Toxic Rick',
              'image':
                  'https://rickandmortyapi.com/api/character/avatar/361.jpeg',
            },
          ]
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
