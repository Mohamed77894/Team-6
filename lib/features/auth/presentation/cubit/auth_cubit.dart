import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/api/auth_token_store.dart';
import '../../domain/usecase/login.dart';
import '../../domain/usecase/register_user.dart';
import '../../domain/usecase/resend_otp.dart';
import '../../domain/usecase/verify_email.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.registerUser,
    required this.verifyEmailUseCase,
    required this.resendOtpUseCase,
    required this.loginUser,
    required this.tokenStore,
  }) : super(const AuthInitial());

  final RegisterUser registerUser;
  final VerifyEmail verifyEmailUseCase;
  final ResendOtp resendOtpUseCase;
  final LoginUser loginUser;
  final AuthTokenStore tokenStore;

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());
    final result = await registerUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.msg)),
      (_) => emit(AuthRegistrationSucceeded(email)),
    );
  }

  Future<void> verifyEmail({required String email, required String otp}) async {
    emit(const AuthLoading());
    final result = await verifyEmailUseCase(email: email, otp: otp);
    result.fold(
      (failure) => emit(AuthFailure(failure.msg)),
      (_) => emit(const AuthEmailVerificationSucceeded()),
    );
  }

  Future<void> resendOtp(String email) async {
    emit(const AuthLoading());
    final result = await resendOtpUseCase(email);
    result.fold(
      (failure) => emit(AuthFailure(failure.msg)),
      (_) => emit(const AuthOtpResent()),
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());
    final result = await loginUser(email: email, password: password);
    result.fold((failure) => emit(AuthFailure(failure.msg)), (session) {
      tokenStore.save(session.accessToken);
      emit(AuthLoginSucceeded(session));
    });
  }
}
