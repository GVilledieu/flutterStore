import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/widgets/common/appbar_widget.dart';
import 'package:store/widgets/common/drawer_widget.dart';
import 'package:store/widgets/product-details/product_details_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Récupérer le produit actuellement sélectionné depuis le ProductProvider
    final product = context.watch<ProductProvider>().product;

    return Scaffold(
      appBar: AppbarWidget(),
      // si l'écran est superposé, si le drawer n'est pas présent, une flèche de retour va apparaître
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Passer le produit actuel à ProductDetailsWidget
            ProductDetailsWidget(product: product),
          ],
        ),
      ),
    );
  }
}
