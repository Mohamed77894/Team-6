import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_product_details.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._getProductDetails)
    : super(const ProductDetailsInitial());

  final GetProductDetails _getProductDetails;

  Future<void> loadProduct(String id) async {
    emit(const ProductDetailsLoading());
    final result = await _getProductDetails(id);
    result.fold(
      (failure) => emit(ProductDetailsFailure(failure.msg)),
      (product) => emit(ProductDetailsSuccess(product)),
    );
  }
}
