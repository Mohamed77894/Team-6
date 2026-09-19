import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product_page.dart';

part 'products_state.freezed.dart';

@freezed
sealed class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = ProductsInitial;
  const factory ProductsState.loading() = ProductsLoading;
  const factory ProductsState.success(ProductPage page) = ProductsSuccess;
  const factory ProductsState.failure(String message) = ProductsFailure;
}
