// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'input_function_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InputFunctionStateTearOff {
  const _$InputFunctionStateTearOff();

  _Loaded loaded(List<FunctionModel> functions) {
    return _Loaded(
      functions,
    );
  }
}

/// @nodoc
const $InputFunctionState = _$InputFunctionStateTearOff();

/// @nodoc
mixin _$InputFunctionState {
  List<FunctionModel> get functions => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<FunctionModel> functions) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<FunctionModel> functions)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<FunctionModel> functions)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InputFunctionStateCopyWith<InputFunctionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputFunctionStateCopyWith<$Res> {
  factory $InputFunctionStateCopyWith(
          InputFunctionState value, $Res Function(InputFunctionState) then) =
      _$InputFunctionStateCopyWithImpl<$Res>;
  $Res call({List<FunctionModel> functions});
}

/// @nodoc
class _$InputFunctionStateCopyWithImpl<$Res>
    implements $InputFunctionStateCopyWith<$Res> {
  _$InputFunctionStateCopyWithImpl(this._value, this._then);

  final InputFunctionState _value;
  // ignore: unused_field
  final $Res Function(InputFunctionState) _then;

  @override
  $Res call({
    Object? functions = freezed,
  }) {
    return _then(_value.copyWith(
      functions: functions == freezed
          ? _value.functions
          : functions // ignore: cast_nullable_to_non_nullable
              as List<FunctionModel>,
    ));
  }
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res>
    implements $InputFunctionStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  @override
  $Res call({List<FunctionModel> functions});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$InputFunctionStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? functions = freezed,
  }) {
    return _then(_Loaded(
      functions == freezed
          ? _value.functions
          : functions // ignore: cast_nullable_to_non_nullable
              as List<FunctionModel>,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(this.functions);

  @override
  final List<FunctionModel> functions;

  @override
  String toString() {
    return 'InputFunctionState.loaded(functions: $functions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality().equals(other.functions, functions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(functions));

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<FunctionModel> functions) loaded,
  }) {
    return loaded(functions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<FunctionModel> functions)? loaded,
  }) {
    return loaded?.call(functions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<FunctionModel> functions)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(functions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements InputFunctionState {
  const factory _Loaded(List<FunctionModel> functions) = _$_Loaded;

  @override
  List<FunctionModel> get functions;
  @override
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}
