import 'dart:convert';

import 'package:casino_test/core/error/server_exception.dart';
import 'package:casino_test/core/network/endpoint.dart';
import 'package:casino_test/features/data/models/character_model.dart';
import 'package:http/http.dart' as http;

abstract class CharactersRemoteDataSource {
  Future<CharacterModel> getCharacters();
}

class CharactersRemoteDataSourceImpl implements CharactersRemoteDataSource {
  final http.Client client;

  CharactersRemoteDataSourceImpl({required this.client});

  @override
  Future<CharacterModel> getCharacters() async {
    final response = await client.get(
      Uri.parse(Endpoint.characters),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return CharacterModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
