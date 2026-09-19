import '../../features/products/data/models/product_page_model.dart';

import 'product_model.dart';

/// Compatibility model for the former project structure.
///
/// New code uses `ProductPageModel` from the products feature instead.
class ProductResponseModel extends ProductPageModel {
  ProductResponseModel({
    required List<ProductModel> items,
    required super.page,
    required super.pageSize,
    required super.totalCount,
    required super.hasNextPage,
    required super.hasPreviousPage,
  }) : super(items: items);

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    final page = ProductPageModel.fromJson(json);
    return ProductResponseModel(
      items: page.items.whereType<ProductModel>().toList(),
      page: page.page,
      pageSize: page.pageSize,
      totalCount: page.totalCount,
      hasNextPage: page.hasNextPage,
      hasPreviousPage: page.hasPreviousPage,
    );
  }
}
