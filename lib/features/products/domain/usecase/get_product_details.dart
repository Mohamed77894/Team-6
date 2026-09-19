import 'package:fpdart/fpdart.dart';

import '../../../../core/network/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductDetails {
  const GetProductDetails(this._repository);
  final ProductRepository _repository;

  Future<Either<ServerFailure, Product>> call(String id) =>
      _repository.getProduct(id);
}
