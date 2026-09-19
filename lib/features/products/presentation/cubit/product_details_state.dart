import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'product_details_state.freezed.dart';

@freezed
sealed class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = ProductDetailsInitial;
  const factory ProductDetailsState.loading() = ProductDetailsLoading;
  const factory ProductDetailsState.success(Product product) =
      ProductDetailsSuccess;
  const factory ProductDetailsState.failure(String message) =
      ProductDetailsFailure;
}
