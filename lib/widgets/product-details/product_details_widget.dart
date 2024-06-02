import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/providers/cart_provider.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({Key? key, Product? product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Récupérer le produit à afficher depuis ProductProvider
    final product = context.watch<ProductProvider>().product;

    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                product!.image,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          product.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        Text(
          '${product.price.toStringAsFixed(2)}€',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        RatingStars(
          value: product.rating['rate'],
        ),
        // Bouton "Add to Cart"
        ElevatedButton(
          onPressed: () {
            // Ajouter le produit au panier
            context.push("/");
          },
          child: const Text('Retourner à l\'accueil'),
        ),
        ElevatedButton(
          onPressed: () {
            // Ajouter le produit au panier
            context.read<CartProvider>().addToCart(product);
            _showAddedToCartPopup(context);
          },
          child: const Text('Ajouter au panier'),
        ),
      ],
    );
  }

  void _showAddedToCartPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bravo !'),
        content: const Text('Votre produit à bien été ajouté au panier'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () {
              context.push('/cart');
            },
            child: const Text('Aller au panier'),
          ),
        ],
      ),
    );
  }
}
