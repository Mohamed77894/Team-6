import 'package:fpdart/fpdart.dart';

import '../../../../core/network/error/failures.dart';
import '../repositories/auth_repository.dart';

class ResendOtp {
  const ResendOtp(this._repository);
  final AuthRepository _repository;

  Future<Either<ServerFailure, Unit>> call(String email) =>
      _repository.resendOtp(email);
}
