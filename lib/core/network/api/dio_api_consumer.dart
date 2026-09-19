import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'api.dart';
import '../error/errors.dart';

class DioApiConsumer implements ApiConsumer {
  final Dio dio;

  DioApiConsumer({required this.dio});

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
        options: Options(headers: headers),
      );

      return Right(_asMap(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure(msg: _errorMessage(e)));
    }
  }

  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> post({
    required String path,
    required Object body,
    String? contentType,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.post(
        '${Api.baseUrl}$path',
        data: body,
        queryParameters: queryParameters,
        options: Options(contentType: contentType, headers: headers),
      );
      return Right(_asMap(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure(msg: _errorMessage(e)));
    }
  }

  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> put({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.put(
        '${Api.baseUrl}$path',
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return Right(_asMap(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure(msg: _errorMessage(e)));
    }
  }

  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> delete({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.delete(
        '${Api.baseUrl}$path',
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return Right(_asMap(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure(msg: _errorMessage(e)));
    }
  }

  Map<String, dynamic> _asMap(dynamic data) {
    if (data is Map) return Map<String, dynamic>.from(data);
    return <String, dynamic>{};
  }

  String _errorMessage(DioException error) {
    final data = error.response?.data;
    if (data is Map) {
      final message = data['message'] ?? data['detail'] ?? data['title'];
      if (message is String && message.isNotEmpty) return message;
      final errors = data['errors'];
      if (errors is Map && errors.values.isNotEmpty) {
        final first = errors.values.first;
        if (first is List && first.isNotEmpty) return first.first.toString();
      }
    }
    return error.message ?? 'Something went wrong. Please try again.';
  }
}
