import 'package:fpdart/fpdart.dart';

import '../../../../core/network/error/failures.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  const RegisterUser(this._repository);
  final AuthRepository _repository;

  Future<Either<ServerFailure, Unit>> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) => _repository.register(
    firstName: firstName,
    lastName: lastName,
    email: email,
    password: password,
  );
}
