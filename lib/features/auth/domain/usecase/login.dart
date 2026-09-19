import 'package:fpdart/fpdart.dart';

import '../../../../core/network/error/failures.dart';
import '../entities/auth_session.dart';
import '../repositories/auth_repository.dart';

class LoginUser {
  const LoginUser(this._repository);
  final AuthRepository _repository;

  Future<Either<ServerFailure, AuthSession>> call({
    required String email,
    required String password,
  }) => _repository.login(email: email, password: password);
}
