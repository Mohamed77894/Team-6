import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _addItem() {
    final name = TextEditingController();
    final url = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(labelText: 'Name'),
              autofocus: true,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: url,
              decoration: const InputDecoration(labelText: 'Image URL'),
              keyboardType: TextInputType.url,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final itemName = name.text.trim();
              if (itemName.isEmpty) return;
              context.read<CartCubit>().addItem(
                CartItem(
                  id: 'custom-$itemName-${DateTime.now().microsecondsSinceEpoch}',
                  name: itemName,
                  imageUrl: url.text.trim(),
                ),
              );
              Navigator.pop(dialogContext);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    ).whenComplete(() {
      name.dispose();
      url.dispose();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Cart')),
    floatingActionButton: FloatingActionButton(
      onPressed: _addItem,
      tooltip: 'Add custom item',
      child: const Icon(Icons.add),
    ),
    body: BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final items = (state as CartSuccessState).items;
        if (items.isEmpty) {
          return const Center(child: Text('Your cart is empty.'));
        }

        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                separatorBuilder: (_, _) => const Divider(height: 24),
                itemBuilder: (context, index) =>
                    _CartItemTile(item: items[index]),
              ),
            ),
            _CartTotal(total: state.total),
          ],
        );
      },
    ),
  );
}

class _CartItemTile extends StatelessWidget {
  const _CartItemTile({required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 80,
          width: 80,
          child: item.imageUrl.isEmpty
              ? const ColoredBox(
                  color: Color(0xFFF2F2F2),
                  child: Icon(Icons.image_not_supported_outlined),
                )
              : CachedNetworkImage(
                  imageUrl: item.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  errorWidget: (_, _, _) => const ColoredBox(
                    color: Color(0xFFF2F2F2),
                    child: Icon(Icons.image_not_supported_outlined),
                  ),
                ),
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            if (item.price > 0) ...[
              const SizedBox(height: 4),
              Text('\$${item.price.toStringAsFixed(2)}'),
            ],
          ],
        ),
      ),
      IconButton(
        onPressed: () => context.read<CartCubit>().decreaseQuantity(item.id),
        icon: const Icon(Icons.remove_circle_outline),
        tooltip: 'Remove one',
      ),
      Text('${item.quantity}'),
      IconButton(
        onPressed: () => context.read<CartCubit>().addItem(item),
        icon: const Icon(Icons.add_circle_outline),
        tooltip: 'Add one',
      ),
      IconButton(
        onPressed: () => context.read<CartCubit>().removeItem(item.id),
        icon: const Icon(Icons.delete_outline),
        tooltip: 'Remove item',
      ),
    ],
  );
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({required this.total});

  final double total;

  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Total', style: TextStyle(fontWeight: FontWeight.w700)),
          Text(
            '\$${total.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.deepOrange,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}
