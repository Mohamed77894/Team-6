import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_products.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._getProducts) : super(const ProductsInitial());

  final GetProducts _getProducts;

  Future<void> loadProducts() async {
    emit(const ProductsLoading());
    final result = await _getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(failure.msg)),
      (products) => emit(ProductsSuccess(products)),
    );
  }
}
