import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/auth_session.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.registrationSucceeded(String email) =
      AuthRegistrationSucceeded;
  const factory AuthState.emailVerificationSucceeded() =
      AuthEmailVerificationSucceeded;
  const factory AuthState.otpResent() = AuthOtpResent;
  const factory AuthState.loginSucceeded(AuthSession session) =
      AuthLoginSucceeded;
  const factory AuthState.failure(String message) = AuthFailure;
}
