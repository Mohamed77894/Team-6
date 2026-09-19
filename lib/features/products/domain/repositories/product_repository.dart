import 'package:fpdart/fpdart.dart';

import '../../../../core/network/error/failures.dart';
import '../entities/product.dart';
import '../entities/product_page.dart';

abstract class ProductRepository {
  Future<Either<ServerFailure, ProductPage>> getProducts();
  Future<Either<ServerFailure, Product>> getProduct(String id);
}
