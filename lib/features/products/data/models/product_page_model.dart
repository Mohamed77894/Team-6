import '../../domain/entities/product_page.dart';
import 'product_model.dart';

class ProductPageModel extends ProductPage {
  ProductPageModel({
    required super.items,
    required super.page,
    required super.pageSize,
    required super.totalCount,
    required super.hasNextPage,
    required super.hasPreviousPage,
  });

  factory ProductPageModel.fromJson(Map<String, dynamic> json) =>
      ProductPageModel(
        items: (json['items'] as List<dynamic>? ?? const [])
            .map(
              (item) =>
                  ProductModel.fromJson(Map<String, dynamic>.from(item as Map)),
            )
            .toList(),
        page: (json['page'] as num?)?.toInt() ?? 1,
        pageSize: (json['pageSize'] as num?)?.toInt() ?? 0,
        totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
        hasNextPage: json['hasNextPage'] == true,
        hasPreviousPage: json['hasPreviousPage'] == true,
      );
}
