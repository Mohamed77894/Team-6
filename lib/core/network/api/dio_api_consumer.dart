import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'api.dart';
import 'api_consumer.dart';
import '../error/errors.dart';

class DioApiConsumer implements ApiConsumer {
  final Dio dio;

  DioApiConsumer({
    required this.dio,
  });

  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.get(
        '${Api.baseUrl}$path',
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return Right(
        Map<String, dynamic>.from(response.data),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          msg: e.message ?? 'Something went wrong',
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> post({
    required String path,
    required Object body,
    String? contentType,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> put({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> delete({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    throw UnimplementedError();
  }
}