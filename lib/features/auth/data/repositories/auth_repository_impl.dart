import 'package:fpdart/fpdart.dart';

import '../../../../core/network/error/failures.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<Either<ServerFailure, Unit>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) => _remoteDataSource.register(
    firstName: firstName,
    lastName: lastName,
    email: email,
    password: password,
  );

  @override
  Future<Either<ServerFailure, Unit>> verifyEmail({
    required String email,
    required String otp,
  }) => _remoteDataSource.verifyEmail(email: email, otp: otp);

  @override
  Future<Either<ServerFailure, Unit>> resendOtp(String email) =>
      _remoteDataSource.resendOtp(email);

  @override
  Future<Either<ServerFailure, AuthSession>> login({
    required String email,
    required String password,
  }) => _remoteDataSource.login(email: email, password: password);
}
