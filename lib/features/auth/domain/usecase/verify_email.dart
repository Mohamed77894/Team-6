import 'package:fpdart/fpdart.dart';

import '../../../../core/network/error/failures.dart';
import '../repositories/auth_repository.dart';

class VerifyEmail {
  const VerifyEmail(this._repository);
  final AuthRepository _repository;

  Future<Either<ServerFailure, Unit>> call({
    required String email,
    required String otp,
  }) => _repository.verifyEmail(email: email, otp: otp);
}
