// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_calc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimeCalcState {

 int get totalBreakSeconds; int get totalBreakCount;
/// Create a copy of TimeCalcState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeCalcStateCopyWith<TimeCalcState> get copyWith => _$TimeCalcStateCopyWithImpl<TimeCalcState>(this as TimeCalcState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeCalcState&&(identical(other.totalBreakSeconds, totalBreakSeconds) || other.totalBreakSeconds == totalBreakSeconds)&&(identical(other.totalBreakCount, totalBreakCount) || other.totalBreakCount == totalBreakCount));
}


@override
int get hashCode => Object.hash(runtimeType,totalBreakSeconds,totalBreakCount);

@override
String toString() {
  return 'TimeCalcState(totalBreakSeconds: $totalBreakSeconds, totalBreakCount: $totalBreakCount)';
}


}

/// @nodoc
abstract mixin class $TimeCalcStateCopyWith<$Res>  {
  factory $TimeCalcStateCopyWith(TimeCalcState value, $Res Function(TimeCalcState) _then) = _$TimeCalcStateCopyWithImpl;
@useResult
$Res call({
 int totalBreakSeconds, int totalBreakCount
});




}
/// @nodoc
class _$TimeCalcStateCopyWithImpl<$Res>
    implements $TimeCalcStateCopyWith<$Res> {
  _$TimeCalcStateCopyWithImpl(this._self, this._then);

  final TimeCalcState _self;
  final $Res Function(TimeCalcState) _then;

/// Create a copy of TimeCalcState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalBreakSeconds = null,Object? totalBreakCount = null,}) {
  return _then(_self.copyWith(
totalBreakSeconds: null == totalBreakSeconds ? _self.totalBreakSeconds : totalBreakSeconds // ignore: cast_nullable_to_non_nullable
as int,totalBreakCount: null == totalBreakCount ? _self.totalBreakCount : totalBreakCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeCalcState].
extension TimeCalcStatePatterns on TimeCalcState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeCalcState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeCalcState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeCalcState value)  $default,){
final _that = this;
switch (_that) {
case _TimeCalcState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeCalcState value)?  $default,){
final _that = this;
switch (_that) {
case _TimeCalcState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalBreakSeconds,  int totalBreakCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeCalcState() when $default != null:
return $default(_that.totalBreakSeconds,_that.totalBreakCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalBreakSeconds,  int totalBreakCount)  $default,) {final _that = this;
switch (_that) {
case _TimeCalcState():
return $default(_that.totalBreakSeconds,_that.totalBreakCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalBreakSeconds,  int totalBreakCount)?  $default,) {final _that = this;
switch (_that) {
case _TimeCalcState() when $default != null:
return $default(_that.totalBreakSeconds,_that.totalBreakCount);case _:
  return null;

}
}

}

/// @nodoc


class _TimeCalcState implements TimeCalcState {
  const _TimeCalcState({required this.totalBreakSeconds, required this.totalBreakCount});
  

@override final  int totalBreakSeconds;
@override final  int totalBreakCount;

/// Create a copy of TimeCalcState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeCalcStateCopyWith<_TimeCalcState> get copyWith => __$TimeCalcStateCopyWithImpl<_TimeCalcState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeCalcState&&(identical(other.totalBreakSeconds, totalBreakSeconds) || other.totalBreakSeconds == totalBreakSeconds)&&(identical(other.totalBreakCount, totalBreakCount) || other.totalBreakCount == totalBreakCount));
}


@override
int get hashCode => Object.hash(runtimeType,totalBreakSeconds,totalBreakCount);

@override
String toString() {
  return 'TimeCalcState(totalBreakSeconds: $totalBreakSeconds, totalBreakCount: $totalBreakCount)';
}


}

/// @nodoc
abstract mixin class _$TimeCalcStateCopyWith<$Res> implements $TimeCalcStateCopyWith<$Res> {
  factory _$TimeCalcStateCopyWith(_TimeCalcState value, $Res Function(_TimeCalcState) _then) = __$TimeCalcStateCopyWithImpl;
@override @useResult
$Res call({
 int totalBreakSeconds, int totalBreakCount
});




}
/// @nodoc
class __$TimeCalcStateCopyWithImpl<$Res>
    implements _$TimeCalcStateCopyWith<$Res> {
  __$TimeCalcStateCopyWithImpl(this._self, this._then);

  final _TimeCalcState _self;
  final $Res Function(_TimeCalcState) _then;

/// Create a copy of TimeCalcState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBreakSeconds = null,Object? totalBreakCount = null,}) {
  return _then(_TimeCalcState(
totalBreakSeconds: null == totalBreakSeconds ? _self.totalBreakSeconds : totalBreakSeconds // ignore: cast_nullable_to_non_nullable
as int,totalBreakCount: null == totalBreakCount ? _self.totalBreakCount : totalBreakCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
