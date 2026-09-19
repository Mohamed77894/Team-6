import 'package:fpdart/fpdart.dart';

import '../../../../core/network/error/failures.dart';
import '../entities/auth_session.dart';

abstract class AuthRepository {
  Future<Either<ServerFailure, Unit>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<Either<ServerFailure, Unit>> verifyEmail({
    required String email,
    required String otp,
  });

  Future<Either<ServerFailure, Unit>> resendOtp(String email);

  Future<Either<ServerFailure, AuthSession>> login({
    required String email,
    required String password,
  });
}
