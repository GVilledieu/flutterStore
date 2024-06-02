import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/category_name_provider.dart';
import 'package:store/providers/category_provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) {
          if (categoryProvider.categories.isEmpty) {
            categoryProvider.fetchCategories();
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: categoryProvider.categories.length,
              itemBuilder: (context, index) {
                final category = categoryProvider.categories[index];
                return ListTile(
                  leading: const Icon(Icons.category),
                  title: Text(category),
                  onTap: () {
                    Provider.of<CategoryNameProvider>(context, listen: false)
                        .setSelectedCategory(category);
                    Navigator.pop(context); // Close the drawer
                    // Navigate to the products screen with the selected category
                    context.push("/products");
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
