import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.productCode,
    required super.name,
    required super.description,
    required super.arabicName,
    required super.arabicDescription,
    required super.coverPictureUrl,
    required super.price,
    required super.stock,
    required super.weight,
    required super.color,
    required super.rating,
    required super.reviewsCount,
    required super.discountPercentage,
    required super.sellerId,
    required super.categories,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: _text(json['id']),
    productCode: _text(json['productCode']),
    name: _text(json['name']),
    description: _text(json['description']),
    arabicName: _text(json['arabicName']),
    arabicDescription: _text(json['arabicDescription']),
    coverPictureUrl: _text(json['coverPictureUrl']),
    price: _number(json['price']),
    stock: _integer(json['stock']),
    weight: _number(json['weight']),
    color: _text(json['color']),
    rating: _integer(json['rating']),
    reviewsCount: _integer(json['reviewsCount']),
    discountPercentage: _number(json['discountPercentage']),
    sellerId: _text(json['sellerId']),
    categories: (json['categories'] as List<dynamic>? ?? const [])
        .map((category) => category.toString())
        .toList(),
  );
}

String _text(dynamic value) => value?.toString() ?? '';
double _number(dynamic value) => value is num ? value.toDouble() : 0;
int _integer(dynamic value) => value is num ? value.toInt() : 0;
