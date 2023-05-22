import 'dart:convert';

import 'package:casino_test/features/data/models/character_model.dart';
import 'package:casino_test/features/domain/entities/character.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final characterModel = CharacterModel(
    id: 361,
    name: 'Toxic Rick',
    image: 'https://rickandmortyapi.com/api/character/avatar/361.jpeg',
  );

  test(
    'should be a subclass of Character entity',
    () async {
      expect(characterModel, isA<Character>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model from the JSON file',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(
          fixture('character.json'),
        );

        final result = CharacterModel.fromJson(jsonMap);
        expect(result, characterModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = characterModel.toJson();

        final expectedJsonMap = {
          'id': 361,
          'name': 'Toxic Rick',
          'image': 'https://rickandmortyapi.com/api/character/avatar/361.jpeg',
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
