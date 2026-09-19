import 'package:fpdart/fpdart.dart';

import '../../../../core/network/error/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_page.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl(this._remoteDataSource);

  final ProductRemoteDataSource _remoteDataSource;

  @override
  Future<Either<ServerFailure, ProductPage>> getProducts() =>
      _remoteDataSource.getProducts();

  @override
  Future<Either<ServerFailure, Product>> getProduct(String id) =>
      _remoteDataSource.getProduct(id);
}
