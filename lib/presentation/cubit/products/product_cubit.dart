import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_5/domain/repositories/product_repository.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit({
    required this.repository,
  }) : super(ProductsInitialState());

  Future<void> fetchProducts() async {
    emit(ProductsLoadingState());

    final result = await repository.getProducts();

    result.fold(
      (failure) {
        emit(
          ProductsFailureState(
            message: failure.msg,
          ),
        );
      },
      (response) {
        emit(
          ProductsSuccessState(
            response: response,
          ),
        );
      },
    );
  }
}