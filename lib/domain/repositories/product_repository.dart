import 'package:fpdart/fpdart.dart';

import '../../../core/network/error/errors.dart';
import '../../../data/models/product_response_model.dart';

abstract class ProductRepository {
  Future<Either<ServerFailure, ProductResponseModel>> getProducts();
}