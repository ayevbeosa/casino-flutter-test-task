// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginatedCharacterModel _$$_PaginatedCharacterModelFromJson(
        Map<String, dynamic> json) =>
    _$_PaginatedCharacterModel(
      info: PaginationInfoModel.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PaginatedCharacterModelToJson(
        _$_PaginatedCharacterModel instance) =>
    <String, dynamic>{
      'info': instance.info.toJson(),
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

_$_PaginationInfo _$$_PaginationInfoFromJson(Map<String, dynamic> json) =>
    _$_PaginationInfo(
      count: json['count'] as num,
      pages: json['pages'] as num,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$$_PaginationInfoToJson(_$_PaginationInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };

_$_CharacterModel _$$_CharacterModelFromJson(Map<String, dynamic> json) =>
    _$_CharacterModel(
      id: json['id'] as num,
      name: json['name'] as String,
      image: json['image'] as String,
      gender: json['gender'] as String,
      species: json['species'] as String,
      status: json['status'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CharacterModelToJson(_$_CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'gender': instance.gender,
      'species': instance.species,
      'status': instance.status,
      'episode': instance.episode,
      'location': instance.location.toJson(),
    };

_$_LocationModel _$$_LocationModelFromJson(Map<String, dynamic> json) =>
    _$_LocationModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_LocationModelToJson(_$_LocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
