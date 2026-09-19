// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthInitial value)?  initial,TResult Function( AuthLoading value)?  loading,TResult Function( AuthRegistrationSucceeded value)?  registrationSucceeded,TResult Function( AuthEmailVerificationSucceeded value)?  emailVerificationSucceeded,TResult Function( AuthOtpResent value)?  otpResent,TResult Function( AuthLoginSucceeded value)?  loginSucceeded,TResult Function( AuthFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoading() when loading != null:
return loading(_that);case AuthRegistrationSucceeded() when registrationSucceeded != null:
return registrationSucceeded(_that);case AuthEmailVerificationSucceeded() when emailVerificationSucceeded != null:
return emailVerificationSucceeded(_that);case AuthOtpResent() when otpResent != null:
return otpResent(_that);case AuthLoginSucceeded() when loginSucceeded != null:
return loginSucceeded(_that);case AuthFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthInitial value)  initial,required TResult Function( AuthLoading value)  loading,required TResult Function( AuthRegistrationSucceeded value)  registrationSucceeded,required TResult Function( AuthEmailVerificationSucceeded value)  emailVerificationSucceeded,required TResult Function( AuthOtpResent value)  otpResent,required TResult Function( AuthLoginSucceeded value)  loginSucceeded,required TResult Function( AuthFailure value)  failure,}){
final _that = this;
switch (_that) {
case AuthInitial():
return initial(_that);case AuthLoading():
return loading(_that);case AuthRegistrationSucceeded():
return registrationSucceeded(_that);case AuthEmailVerificationSucceeded():
return emailVerificationSucceeded(_that);case AuthOtpResent():
return otpResent(_that);case AuthLoginSucceeded():
return loginSucceeded(_that);case AuthFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthInitial value)?  initial,TResult? Function( AuthLoading value)?  loading,TResult? Function( AuthRegistrationSucceeded value)?  registrationSucceeded,TResult? Function( AuthEmailVerificationSucceeded value)?  emailVerificationSucceeded,TResult? Function( AuthOtpResent value)?  otpResent,TResult? Function( AuthLoginSucceeded value)?  loginSucceeded,TResult? Function( AuthFailure value)?  failure,}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoading() when loading != null:
return loading(_that);case AuthRegistrationSucceeded() when registrationSucceeded != null:
return registrationSucceeded(_that);case AuthEmailVerificationSucceeded() when emailVerificationSucceeded != null:
return emailVerificationSucceeded(_that);case AuthOtpResent() when otpResent != null:
return otpResent(_that);case AuthLoginSucceeded() when loginSucceeded != null:
return loginSucceeded(_that);case AuthFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String email)?  registrationSucceeded,TResult Function()?  emailVerificationSucceeded,TResult Function()?  otpResent,TResult Function( AuthSession session)?  loginSucceeded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoading() when loading != null:
return loading();case AuthRegistrationSucceeded() when registrationSucceeded != null:
return registrationSucceeded(_that.email);case AuthEmailVerificationSucceeded() when emailVerificationSucceeded != null:
return emailVerificationSucceeded();case AuthOtpResent() when otpResent != null:
return otpResent();case AuthLoginSucceeded() when loginSucceeded != null:
return loginSucceeded(_that.session);case AuthFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String email)  registrationSucceeded,required TResult Function()  emailVerificationSucceeded,required TResult Function()  otpResent,required TResult Function( AuthSession session)  loginSucceeded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case AuthInitial():
return initial();case AuthLoading():
return loading();case AuthRegistrationSucceeded():
return registrationSucceeded(_that.email);case AuthEmailVerificationSucceeded():
return emailVerificationSucceeded();case AuthOtpResent():
return otpResent();case AuthLoginSucceeded():
return loginSucceeded(_that.session);case AuthFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String email)?  registrationSucceeded,TResult? Function()?  emailVerificationSucceeded,TResult? Function()?  otpResent,TResult? Function( AuthSession session)?  loginSucceeded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoading() when loading != null:
return loading();case AuthRegistrationSucceeded() when registrationSucceeded != null:
return registrationSucceeded(_that.email);case AuthEmailVerificationSucceeded() when emailVerificationSucceeded != null:
return emailVerificationSucceeded();case AuthOtpResent() when otpResent != null:
return otpResent();case AuthLoginSucceeded() when loginSucceeded != null:
return loginSucceeded(_that.session);case AuthFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthInitial implements AuthState {
  const AuthInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class AuthLoading implements AuthState {
  const AuthLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class AuthRegistrationSucceeded implements AuthState {
  const AuthRegistrationSucceeded(this.email);
  

 final  String email;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthRegistrationSucceededCopyWith<AuthRegistrationSucceeded> get copyWith => _$AuthRegistrationSucceededCopyWithImpl<AuthRegistrationSucceeded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRegistrationSucceeded&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthState.registrationSucceeded(email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthRegistrationSucceededCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthRegistrationSucceededCopyWith(AuthRegistrationSucceeded value, $Res Function(AuthRegistrationSucceeded) _then) = _$AuthRegistrationSucceededCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AuthRegistrationSucceededCopyWithImpl<$Res>
    implements $AuthRegistrationSucceededCopyWith<$Res> {
  _$AuthRegistrationSucceededCopyWithImpl(this._self, this._then);

  final AuthRegistrationSucceeded _self;
  final $Res Function(AuthRegistrationSucceeded) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(AuthRegistrationSucceeded(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthEmailVerificationSucceeded implements AuthState {
  const AuthEmailVerificationSucceeded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEmailVerificationSucceeded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.emailVerificationSucceeded()';
}


}




/// @nodoc


class AuthOtpResent implements AuthState {
  const AuthOtpResent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthOtpResent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.otpResent()';
}


}




/// @nodoc


class AuthLoginSucceeded implements AuthState {
  const AuthLoginSucceeded(this.session);
  

 final  AuthSession session;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoginSucceededCopyWith<AuthLoginSucceeded> get copyWith => _$AuthLoginSucceededCopyWithImpl<AuthLoginSucceeded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoginSucceeded&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'AuthState.loginSucceeded(session: $session)';
}


}

/// @nodoc
abstract mixin class $AuthLoginSucceededCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthLoginSucceededCopyWith(AuthLoginSucceeded value, $Res Function(AuthLoginSucceeded) _then) = _$AuthLoginSucceededCopyWithImpl;
@useResult
$Res call({
 AuthSession session
});




}
/// @nodoc
class _$AuthLoginSucceededCopyWithImpl<$Res>
    implements $AuthLoginSucceededCopyWith<$Res> {
  _$AuthLoginSucceededCopyWithImpl(this._self, this._then);

  final AuthLoginSucceeded _self;
  final $Res Function(AuthLoginSucceeded) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(AuthLoginSucceeded(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AuthSession,
  ));
}


}

/// @nodoc


class AuthFailure implements AuthState {
  const AuthFailure(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<AuthFailure> get copyWith => _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthFailureCopyWith(AuthFailure value, $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
