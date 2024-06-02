import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/category_name_provider.dart';
import 'package:store/services/products_service.dart';
import 'package:store/models/product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryNameProvider>(context).selectedCategory;

    return Scaffold(
      appBar: AppBar(
        title: Text('Products: $category'),
      ),
      body: FutureBuilder<List<Product>>(
        future: ProductsService().fetchProductsByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching products'));
          } else {
            final products = snapshot.data ?? []; // Liste de produits ou liste vide si nulle

            if (products.isEmpty) {
              return const Center(child: Text('No products found'));
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: Column(
                    children: [
                      if (product.image != null) Image.network(product.image!, height: 100),
                      Text(product.title ?? ''),
                      Text('\$${product.price ?? ''}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
