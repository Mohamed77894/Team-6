import 'package:fpdart/fpdart.dart';

import '../../core/network/error/errors.dart';
import 'product_repository.dart';
import '../../data/data_sources/product_remote_data_source.dart';
import '../../data/models/product_response_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<ServerFailure, ProductResponseModel>> getProducts() {
    return remoteDataSource.getProducts();
  }
}