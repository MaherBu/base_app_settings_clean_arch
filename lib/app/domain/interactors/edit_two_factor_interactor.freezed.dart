// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_two_factor_interactor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditTwoFactorInteractorParamsTearOff {
  const _$EditTwoFactorInteractorParamsTearOff();

  _EditTwoFactorInteractorParams call({required bool enable}) {
    return _EditTwoFactorInteractorParams(
      enable: enable,
    );
  }
}

/// @nodoc
const $EditTwoFactorInteractorParams = _$EditTwoFactorInteractorParamsTearOff();

/// @nodoc
mixin _$EditTwoFactorInteractorParams {
  bool get enable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditTwoFactorInteractorParamsCopyWith<EditTwoFactorInteractorParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTwoFactorInteractorParamsCopyWith<$Res> {
  factory $EditTwoFactorInteractorParamsCopyWith(
          EditTwoFactorInteractorParams value,
          $Res Function(EditTwoFactorInteractorParams) then) =
      _$EditTwoFactorInteractorParamsCopyWithImpl<$Res>;
  $Res call({bool enable});
}

/// @nodoc
class _$EditTwoFactorInteractorParamsCopyWithImpl<$Res>
    implements $EditTwoFactorInteractorParamsCopyWith<$Res> {
  _$EditTwoFactorInteractorParamsCopyWithImpl(this._value, this._then);

  final EditTwoFactorInteractorParams _value;
  // ignore: unused_field
  final $Res Function(EditTwoFactorInteractorParams) _then;

  @override
  $Res call({
    Object? enable = freezed,
  }) {
    return _then(_value.copyWith(
      enable: enable == freezed
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$EditTwoFactorInteractorParamsCopyWith<$Res>
    implements $EditTwoFactorInteractorParamsCopyWith<$Res> {
  factory _$EditTwoFactorInteractorParamsCopyWith(
          _EditTwoFactorInteractorParams value,
          $Res Function(_EditTwoFactorInteractorParams) then) =
      __$EditTwoFactorInteractorParamsCopyWithImpl<$Res>;
  @override
  $Res call({bool enable});
}

/// @nodoc
class __$EditTwoFactorInteractorParamsCopyWithImpl<$Res>
    extends _$EditTwoFactorInteractorParamsCopyWithImpl<$Res>
    implements _$EditTwoFactorInteractorParamsCopyWith<$Res> {
  __$EditTwoFactorInteractorParamsCopyWithImpl(
      _EditTwoFactorInteractorParams _value,
      $Res Function(_EditTwoFactorInteractorParams) _then)
      : super(_value, (v) => _then(v as _EditTwoFactorInteractorParams));

  @override
  _EditTwoFactorInteractorParams get _value =>
      super._value as _EditTwoFactorInteractorParams;

  @override
  $Res call({
    Object? enable = freezed,
  }) {
    return _then(_EditTwoFactorInteractorParams(
      enable: enable == freezed
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EditTwoFactorInteractorParams
    implements _EditTwoFactorInteractorParams {
  _$_EditTwoFactorInteractorParams({required this.enable});

  @override
  final bool enable;

  @override
  String toString() {
    return 'EditTwoFactorInteractorParams(enable: $enable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditTwoFactorInteractorParams &&
            const DeepCollectionEquality().equals(other.enable, enable));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(enable));

  @JsonKey(ignore: true)
  @override
  _$EditTwoFactorInteractorParamsCopyWith<_EditTwoFactorInteractorParams>
      get copyWith => __$EditTwoFactorInteractorParamsCopyWithImpl<
          _EditTwoFactorInteractorParams>(this, _$identity);
}

abstract class _EditTwoFactorInteractorParams
    implements EditTwoFactorInteractorParams {
  factory _EditTwoFactorInteractorParams({required bool enable}) =
      _$_EditTwoFactorInteractorParams;

  @override
  bool get enable;
  @override
  @JsonKey(ignore: true)
  _$EditTwoFactorInteractorParamsCopyWith<_EditTwoFactorInteractorParams>
      get copyWith => throw _privateConstructorUsedError;
}
