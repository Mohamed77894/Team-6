import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/cubit/products/product_cubit.dart';
import 'presentation/cubit/products/product_state.dart';
class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  void initState() {
    context.read<ProductCubit>().fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return switch (state) {
            ProductsLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),

            ProductsFailureState(:final message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () {
                        context.read<ProductCubit>().fetchProducts();
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),

            ProductsSuccessState(:final response) => ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: response.items.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                itemBuilder: (context, index) {
                  final product = response.items[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                         Image.network(
  product.coverPictureUrl,
  height: 100,
  width: 100,
  errorBuilder: (context, error, stackTrace) {
    return const Icon(
      Icons.image_not_supported,
    );
  },
),

                          const SizedBox(width: 8),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  product.description,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 16),
                              ],
                            ),
                          ),

                          Text(
                            product.price.toString(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

            _ => const SizedBox.expand(),
          };
        },
      ),
    );
  }
}