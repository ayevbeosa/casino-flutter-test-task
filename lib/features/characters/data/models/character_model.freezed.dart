// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginatedCharacterModel _$PaginatedCharacterModelFromJson(
    Map<String, dynamic> json) {
  return _PaginatedCharacterModel.fromJson(json);
}

/// @nodoc
mixin _$PaginatedCharacterModel {
  PaginationInfoModel get info => throw _privateConstructorUsedError;
  List<CharacterModel> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedCharacterModelCopyWith<PaginatedCharacterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedCharacterModelCopyWith<$Res> {
  factory $PaginatedCharacterModelCopyWith(PaginatedCharacterModel value,
          $Res Function(PaginatedCharacterModel) then) =
      _$PaginatedCharacterModelCopyWithImpl<$Res, PaginatedCharacterModel>;
  @useResult
  $Res call({PaginationInfoModel info, List<CharacterModel> results});

  $PaginationInfoModelCopyWith<$Res> get info;
}

/// @nodoc
class _$PaginatedCharacterModelCopyWithImpl<$Res,
        $Val extends PaginatedCharacterModel>
    implements $PaginatedCharacterModelCopyWith<$Res> {
  _$PaginatedCharacterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as PaginationInfoModel,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationInfoModelCopyWith<$Res> get info {
    return $PaginationInfoModelCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaginatedCharacterModelCopyWith<$Res>
    implements $PaginatedCharacterModelCopyWith<$Res> {
  factory _$$_PaginatedCharacterModelCopyWith(_$_PaginatedCharacterModel value,
          $Res Function(_$_PaginatedCharacterModel) then) =
      __$$_PaginatedCharacterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaginationInfoModel info, List<CharacterModel> results});

  @override
  $PaginationInfoModelCopyWith<$Res> get info;
}

/// @nodoc
class __$$_PaginatedCharacterModelCopyWithImpl<$Res>
    extends _$PaginatedCharacterModelCopyWithImpl<$Res,
        _$_PaginatedCharacterModel>
    implements _$$_PaginatedCharacterModelCopyWith<$Res> {
  __$$_PaginatedCharacterModelCopyWithImpl(_$_PaginatedCharacterModel _value,
      $Res Function(_$_PaginatedCharacterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_$_PaginatedCharacterModel(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as PaginationInfoModel,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PaginatedCharacterModel implements _PaginatedCharacterModel {
  const _$_PaginatedCharacterModel(
      {required this.info, required final List<CharacterModel> results})
      : _results = results;

  factory _$_PaginatedCharacterModel.fromJson(Map<String, dynamic> json) =>
      _$$_PaginatedCharacterModelFromJson(json);

  @override
  final PaginationInfoModel info;
  final List<CharacterModel> _results;
  @override
  List<CharacterModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedCharacterModel(info: $info, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginatedCharacterModel &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginatedCharacterModelCopyWith<_$_PaginatedCharacterModel>
      get copyWith =>
          __$$_PaginatedCharacterModelCopyWithImpl<_$_PaginatedCharacterModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginatedCharacterModelToJson(
      this,
    );
  }
}

abstract class _PaginatedCharacterModel implements PaginatedCharacterModel {
  const factory _PaginatedCharacterModel(
          {required final PaginationInfoModel info,
          required final List<CharacterModel> results}) =
      _$_PaginatedCharacterModel;

  factory _PaginatedCharacterModel.fromJson(Map<String, dynamic> json) =
      _$_PaginatedCharacterModel.fromJson;

  @override
  PaginationInfoModel get info;
  @override
  List<CharacterModel> get results;
  @override
  @JsonKey(ignore: true)
  _$$_PaginatedCharacterModelCopyWith<_$_PaginatedCharacterModel>
      get copyWith => throw _privateConstructorUsedError;
}

PaginationInfoModel _$PaginationInfoModelFromJson(Map<String, dynamic> json) {
  return _PaginationInfo.fromJson(json);
}

/// @nodoc
mixin _$PaginationInfoModel {
  num get count => throw _privateConstructorUsedError;
  num get pages => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationInfoModelCopyWith<PaginationInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationInfoModelCopyWith<$Res> {
  factory $PaginationInfoModelCopyWith(
          PaginationInfoModel value, $Res Function(PaginationInfoModel) then) =
      _$PaginationInfoModelCopyWithImpl<$Res, PaginationInfoModel>;
  @useResult
  $Res call({num count, num pages, String? next, String? prev});
}

/// @nodoc
class _$PaginationInfoModelCopyWithImpl<$Res, $Val extends PaginationInfoModel>
    implements $PaginationInfoModelCopyWith<$Res> {
  _$PaginationInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? pages = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as num,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as num,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationInfoCopyWith<$Res>
    implements $PaginationInfoModelCopyWith<$Res> {
  factory _$$_PaginationInfoCopyWith(
          _$_PaginationInfo value, $Res Function(_$_PaginationInfo) then) =
      __$$_PaginationInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num count, num pages, String? next, String? prev});
}

/// @nodoc
class __$$_PaginationInfoCopyWithImpl<$Res>
    extends _$PaginationInfoModelCopyWithImpl<$Res, _$_PaginationInfo>
    implements _$$_PaginationInfoCopyWith<$Res> {
  __$$_PaginationInfoCopyWithImpl(
      _$_PaginationInfo _value, $Res Function(_$_PaginationInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? pages = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_$_PaginationInfo(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as num,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as num,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PaginationInfo implements _PaginationInfo {
  const _$_PaginationInfo(
      {required this.count,
      required this.pages,
      required this.next,
      required this.prev});

  factory _$_PaginationInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationInfoFromJson(json);

  @override
  final num count;
  @override
  final num pages;
  @override
  final String? next;
  @override
  final String? prev;

  @override
  String toString() {
    return 'PaginationInfoModel(count: $count, pages: $pages, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationInfo &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, pages, next, prev);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationInfoCopyWith<_$_PaginationInfo> get copyWith =>
      __$$_PaginationInfoCopyWithImpl<_$_PaginationInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationInfoToJson(
      this,
    );
  }
}

abstract class _PaginationInfo implements PaginationInfoModel {
  const factory _PaginationInfo(
      {required final num count,
      required final num pages,
      required final String? next,
      required final String? prev}) = _$_PaginationInfo;

  factory _PaginationInfo.fromJson(Map<String, dynamic> json) =
      _$_PaginationInfo.fromJson;

  @override
  num get count;
  @override
  num get pages;
  @override
  String? get next;
  @override
  String? get prev;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationInfoCopyWith<_$_PaginationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) {
  return _CharacterModel.fromJson(json);
}

/// @nodoc
mixin _$CharacterModel {
  num get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterModelCopyWith<CharacterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterModelCopyWith<$Res> {
  factory $CharacterModelCopyWith(
          CharacterModel value, $Res Function(CharacterModel) then) =
      _$CharacterModelCopyWithImpl<$Res, CharacterModel>;
  @useResult
  $Res call({num id, String name, String image});
}

/// @nodoc
class _$CharacterModelCopyWithImpl<$Res, $Val extends CharacterModel>
    implements $CharacterModelCopyWith<$Res> {
  _$CharacterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterModelCopyWith<$Res>
    implements $CharacterModelCopyWith<$Res> {
  factory _$$_CharacterModelCopyWith(
          _$_CharacterModel value, $Res Function(_$_CharacterModel) then) =
      __$$_CharacterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num id, String name, String image});
}

/// @nodoc
class __$$_CharacterModelCopyWithImpl<$Res>
    extends _$CharacterModelCopyWithImpl<$Res, _$_CharacterModel>
    implements _$$_CharacterModelCopyWith<$Res> {
  __$$_CharacterModelCopyWithImpl(
      _$_CharacterModel _value, $Res Function(_$_CharacterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$_CharacterModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CharacterModel implements _CharacterModel {
  const _$_CharacterModel(
      {required this.id, required this.name, required this.image});

  factory _$_CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterModelFromJson(json);

  @override
  final num id;
  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterModelCopyWith<_$_CharacterModel> get copyWith =>
      __$$_CharacterModelCopyWithImpl<_$_CharacterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterModelToJson(
      this,
    );
  }
}

abstract class _CharacterModel implements CharacterModel {
  const factory _CharacterModel(
      {required final num id,
      required final String name,
      required final String image}) = _$_CharacterModel;

  factory _CharacterModel.fromJson(Map<String, dynamic> json) =
      _$_CharacterModel.fromJson;

  @override
  num get id;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterModelCopyWith<_$_CharacterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
