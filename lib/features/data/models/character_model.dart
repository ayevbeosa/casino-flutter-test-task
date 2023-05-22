import 'package:casino_test/features/domain/entities/character.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

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
