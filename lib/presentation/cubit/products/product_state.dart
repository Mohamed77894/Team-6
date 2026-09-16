import '../../../data/models/product_response_model.dart';

sealed class ProductState {}

class ProductsInitialState extends ProductState {}

class ProductsLoadingState extends ProductState {}

class ProductsSuccessState extends ProductState {
  final ProductResponseModel response;

  ProductsSuccessState({
    required this.response,
  });
}

class ProductsFailureState extends ProductState {
  final String message;

  ProductsFailureState({
    required this.message,
  });
}