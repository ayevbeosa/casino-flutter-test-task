import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class PaginatedCharacterModel with _$PaginatedCharacterModel {
  @JsonSerializable(explicitToJson: true)
  const factory PaginatedCharacterModel({
    required PaginationInfoModel info,
    required List<CharacterModel> results,
  }) = _PaginatedCharacterModel;

  factory PaginatedCharacterModel.fromJson(Map<String, dynamic> json) =>
      _$PaginatedCharacterModelFromJson(json);
}

@freezed
class PaginationInfoModel with _$PaginationInfoModel {
  @JsonSerializable(explicitToJson: true)
  const factory PaginationInfoModel({
    required num count,
    required num pages,
    required String? next,
    required String? prev,
  }) = _PaginationInfo;

  factory PaginationInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoModelFromJson(json);
}

@freezed
class CharacterModel with _$CharacterModel {
  @JsonSerializable(explicitToJson: true)
  const factory CharacterModel({
    required num id,
    required String name,
    required String image,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
}
