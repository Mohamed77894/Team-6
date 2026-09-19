import 'package:fpdart/fpdart.dart';

import '../../../../core/network/api/api_consumer.dart';
import '../../../../core/network/api/end_points.dart';
import '../../../../core/network/error/failures.dart';
import '../models/product_model.dart';
import '../models/product_page_model.dart';

class ProductRemoteDataSource {
  const ProductRemoteDataSource(this._apiConsumer);

  final ApiConsumer _apiConsumer;

  Future<Either<ServerFailure, ProductPageModel>> getProducts() async {
    final result = await _apiConsumer.get(path: EndPoints.products);
    return result.map(ProductPageModel.fromJson);
  }

  Future<Either<ServerFailure, ProductModel>> getProduct(String id) async {
    final result = await _apiConsumer.get(path: '${EndPoints.products}/$id');
    return result.map(ProductModel.fromJson);
  }
}
