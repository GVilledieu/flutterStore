import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    // Vérifie si le produit est déjà dans le panier
    final existingProductIndex =
    _cartItems.indexWhere((item) => item.id == product.id);

    if (existingProductIndex != -1) {
      // Si le produit est déjà dans le panier, incrémente juste la quantité
      _cartItems[existingProductIndex].quantityInCart++;
    } else {
      // Sinon, ajoute le produit au panier avec une quantité de 1
      _cartItems.add(product..quantityInCart = 1);
    }

    // Notifie les écouteurs du changement dans le panier
    notifyListeners();
  }
}
