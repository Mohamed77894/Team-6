import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/domain/entities/product.dart';

class CartItem {
  const CartItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.price = 0,
    this.quantity = 1,
  });

  factory CartItem.fromProduct(Product product) => CartItem(
    id: product.id,
    name: product.name,
    imageUrl: product.coverPictureUrl,
    price: product.price,
  );

  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  CartItem copyWith({int? quantity}) => CartItem(
    id: id,
    name: name,
    imageUrl: imageUrl,
    price: price,
    quantity: quantity ?? this.quantity,
  );
}

sealed class CartState {
  const CartState();
}

class CartSuccessState extends CartState {
  const CartSuccessState(this.items);

  final List<CartItem> items;

  double get total =>
      items.fold(0, (total, item) => total + (item.price * item.quantity));
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartSuccessState([]));

  List<CartItem> get _items => (state as CartSuccessState).items;

  void addProduct(Product product) => addItem(CartItem.fromProduct(product));

  void addItem(CartItem item) {
    final index = _items.indexWhere((existing) => existing.id == item.id);
    if (index == -1) {
      emit(CartSuccessState([..._items, item]));
      return;
    }
    final updated = [..._items];
    updated[index] = updated[index].copyWith(
      quantity: updated[index].quantity + item.quantity,
    );
    emit(CartSuccessState(updated));
  }

  void decreaseQuantity(String itemId) {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index == -1) return;

    final updated = [..._items];
    final item = updated[index];
    if (item.quantity == 1) {
      updated.removeAt(index);
    } else {
      updated[index] = item.copyWith(quantity: item.quantity - 1);
    }
    emit(CartSuccessState(updated));
  }

  void removeItem(String itemId) {
    emit(CartSuccessState(_items.where((item) => item.id != itemId).toList()));
  }
}
