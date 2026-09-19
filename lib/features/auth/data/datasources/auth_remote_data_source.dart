import 'package:fpdart/fpdart.dart';

import '../../../../core/network/api/api_consumer.dart';
import '../../../../core/network/api/end_points.dart';
import '../../../../core/network/error/failures.dart';
import '../models/login_response_model.dart';

class AuthRemoteDataSource {
  const AuthRemoteDataSource(this._apiConsumer);

  final ApiConsumer _apiConsumer;

  Future<Either<ServerFailure, Unit>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final result = await _apiConsumer.post(
      path: EndPoints.register,
      body: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
    );
    return result.map((_) => unit);
  }

  Future<Either<ServerFailure, Unit>> verifyEmail({
    required String email,
    required String otp,
  }) async {
    final result = await _apiConsumer.post(
      path: EndPoints.verifyEmail,
      body: {'email': email, 'otp': otp},
    );
    return result.map((_) => unit);
  }

  Future<Either<ServerFailure, Unit>> resendOtp(String email) async {
    final result = await _apiConsumer.post(
      path: EndPoints.resendOtp,
      body: {'email': email},
    );
    return result.map((_) => unit);
  }

  Future<Either<ServerFailure, LoginResponseModel>> login({
    required String email,
    required String password,
  }) async {
    final result = await _apiConsumer.post(
      path: EndPoints.login,
      body: {'email': email, 'password': password},
    );
    return result.map(LoginResponseModel.fromJson);
  }
}
