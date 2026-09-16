import 'package:fpdart/fpdart.dart';

import '../../core/network/api/api_consumer.dart';
import '../../core/network/api/end_points.dart';
import '../../core/network/error/errors.dart';
import '../models/product_response_model.dart';

class ProductRemoteDataSource {
  final ApiConsumer apiConsumer;

  ProductRemoteDataSource({
    required this.apiConsumer,
  });

  Future<Either<ServerFailure, ProductResponseModel>> getProducts() async {
    final result = await apiConsumer.get(
      path: EndPoints.products,
    );

    return result.fold(
      (failure) => Left(failure),
      (data) => Right(
        ProductResponseModel.fromJson(data),
      ),
    );
  }
}