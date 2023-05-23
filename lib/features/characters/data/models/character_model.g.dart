// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedCharacterModel _$PaginatedCharacterModelFromJson(
        Map<String, dynamic> json) =>
    PaginatedCharacterModel(
      info: PaginationInfoModel.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedCharacterModelToJson(
        PaginatedCharacterModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

PaginationInfoModel _$PaginationInfoModelFromJson(Map<String, dynamic> json) =>
    PaginationInfoModel(
      count: json['count'] as num,
      pages: json['pages'] as num,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$PaginationInfoModelToJson(
        PaginationInfoModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      id: json['id'] as num,
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
