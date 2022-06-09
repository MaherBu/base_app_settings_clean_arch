// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tokens_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokensModel _$TokensModelFromJson(Map<String, dynamic> json) {
  return _TokensModel.fromJson(json);
}

/// @nodoc
class _$TokensModelTearOff {
  const _$TokensModelTearOff();

  _TokensModel call({String? accessToken, String? refreshToken}) {
    return _TokensModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  TokensModel fromJson(Map<String, Object?> json) {
    return TokensModel.fromJson(json);
  }
}

/// @nodoc
const $TokensModel = _$TokensModelTearOff();

/// @nodoc
mixin _$TokensModel {
  String? get accessToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokensModelCopyWith<TokensModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokensModelCopyWith<$Res> {
  factory $TokensModelCopyWith(
          TokensModel value, $Res Function(TokensModel) then) =
      _$TokensModelCopyWithImpl<$Res>;
  $Res call({String? accessToken, String? refreshToken});
}

/// @nodoc
class _$TokensModelCopyWithImpl<$Res> implements $TokensModelCopyWith<$Res> {
  _$TokensModelCopyWithImpl(this._value, this._then);

  final TokensModel _value;
  // ignore: unused_field
  final $Res Function(TokensModel) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$TokensModelCopyWith<$Res>
    implements $TokensModelCopyWith<$Res> {
  factory _$TokensModelCopyWith(
          _TokensModel value, $Res Function(_TokensModel) then) =
      __$TokensModelCopyWithImpl<$Res>;
  @override
  $Res call({String? accessToken, String? refreshToken});
}

/// @nodoc
class __$TokensModelCopyWithImpl<$Res> extends _$TokensModelCopyWithImpl<$Res>
    implements _$TokensModelCopyWith<$Res> {
  __$TokensModelCopyWithImpl(
      _TokensModel _value, $Res Function(_TokensModel) _then)
      : super(_value, (v) => _then(v as _TokensModel));

  @override
  _TokensModel get _value => super._value as _TokensModel;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_TokensModel(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokensModel implements _TokensModel {
  _$_TokensModel({this.accessToken, this.refreshToken});

  factory _$_TokensModel.fromJson(Map<String, dynamic> json) =>
      _$$_TokensModelFromJson(json);

  @override
  final String? accessToken;
  @override
  final String? refreshToken;

  @override
  String toString() {
    return 'TokensModel(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TokensModel &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(refreshToken));

  @JsonKey(ignore: true)
  @override
  _$TokensModelCopyWith<_TokensModel> get copyWith =>
      __$TokensModelCopyWithImpl<_TokensModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokensModelToJson(this);
  }
}

abstract class _TokensModel implements TokensModel {
  factory _TokensModel({String? accessToken, String? refreshToken}) =
      _$_TokensModel;

  factory _TokensModel.fromJson(Map<String, dynamic> json) =
      _$_TokensModel.fromJson;

  @override
  String? get accessToken;
  @override
  String? get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$TokensModelCopyWith<_TokensModel> get copyWith =>
      throw _privateConstructorUsedError;
}
