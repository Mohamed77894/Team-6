import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({required this.productId, super.key});
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductDetailsCubit>().loadProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Product details')),
    body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) => switch (state) {
        ProductDetailsInitial() || ProductDetailsLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
        ProductDetailsFailure(:final message) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message, textAlign: TextAlign.center),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () => context
                      .read<ProductDetailsCubit>()
                      .loadProduct(widget.productId),
                  child: const Text('Try again'),
                ),
              ],
            ),
          ),
        ),
        ProductDetailsSuccess(:final product) => _ProductDetails(
          product: product,
        ),
      },
    ),
  );
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      AspectRatio(
        aspectRatio: 1.25,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: product.coverPictureUrl.isEmpty
              ? const ColoredBox(
                  color: Color(0xFFF2F2F2),
                  child: Icon(Icons.image_not_supported_outlined, size: 48),
                )
              : Image.network(
                  product.coverPictureUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const ColoredBox(
                    color: Color(0xFFF2F2F2),
                    child: Icon(Icons.image_not_supported_outlined, size: 48),
                  ),
                ),
        ),
      ),
      const SizedBox(height: 24),
      Text(product.name, style: Theme.of(context).textTheme.headlineSmall),
      const SizedBox(height: 8),
      Text(
        '\$${product.price.toStringAsFixed(2)}',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.deepOrange,
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: 20),
      Text(product.description),
      const SizedBox(height: 24),
      _DetailRow(label: 'Stock', value: product.stock.toString()),
      _DetailRow(
        label: 'Color',
        value: product.color.isEmpty ? '—' : product.color,
      ),
      _DetailRow(label: 'Weight', value: '${product.weight} kg'),
      _DetailRow(
        label: 'Rating',
        value: '${product.rating} (${product.reviewsCount} reviews)',
      ),
      if (product.categories.isNotEmpty)
        _DetailRow(label: 'Categories', value: product.categories.join(', ')),
    ],
  );
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 92,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(child: Text(value)),
      ],
    ),
  );
}
