import 'dart:convert';

import 'package:casino_test/core/error/server_exception.dart';
import 'package:casino_test/core/network/endpoint.dart';
import 'package:casino_test/features/characters/data/models/character_model.dart';
import 'package:http/http.dart' as http;

abstract class CharactersRemoteDataSource {
  Future<PaginatedCharacterModel> getCharacters(int pageNo);
}

class CharactersRemoteDataSourceImpl implements CharactersRemoteDataSource {
  final http.Client client;

  CharactersRemoteDataSourceImpl({required this.client});

  @override
  Future<PaginatedCharacterModel> getCharacters(int pageNo) async {
    final response = await client.get(
      Uri.parse(Endpoint.characters(pageNo)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return PaginatedCharacterModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
