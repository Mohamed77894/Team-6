import 'package:fpdart/fpdart.dart';

import '../../../../core/network/error/failures.dart';
import '../entities/product_page.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  const GetProducts(this._repository);
  final ProductRepository _repository;

  Future<Either<ServerFailure, ProductPage>> call() =>
      _repository.getProducts();
}
