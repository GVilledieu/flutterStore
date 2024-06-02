import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/category_provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) {
            return ListView.builder(
              itemCount: categoryProvider.categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.category),
                  title: Text(categoryProvider.categories[index]),
                );
              },
            );
        },
      ),
    );
  }
}
