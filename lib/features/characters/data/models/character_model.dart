import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class PaginatedCharacterModel extends PaginatedCharacter {
  @override
  final PaginationInfoModel info;

  @override
  final List<CharacterModel> results;

  PaginatedCharacterModel({
    required this.info,
    required this.results,
  }) : super(info: info, results: results);

  factory PaginatedCharacterModel.fromJson(Map<String, dynamic> json) =>
      _$PaginatedCharacterModelFromJson(json);
}

@JsonSerializable()
class PaginationInfoModel extends PaginationInfo {
  PaginationInfoModel({
    required num count,
    required num pages,
    required String? next,
    required String? prev,
  }) : super(count: count, pages: pages, next: next, prev: prev);

  factory PaginationInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoModelFromJson(json);
}

@JsonSerializable()
class CharacterModel extends Character {
  CharacterModel({
    required num id,
    required String name,
    required String image,
  }) : super(id: id, name: name, image: image);

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
