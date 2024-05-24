import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      /*
        title: texte, icône, ou image
        centerTitle: centrer le titre
        leading: regroupement de widgets à gauche de la barre de navigation
        actions: regroupement de widgets à droite de la barre de navigation…
      */
      title: const Text(
          'tests',
        style: TextStyle(
          color: Color.fromRGBO(255, 0, 255, 1),
          fontSize: 20,
          fontFamily: 'RedditMono'
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person)
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart)
        ),
      ],
      centerTitle: true,
    );
  }

  // Permet de définir la hauteur de la barre de navigation
  @override
  Size get preferredSize => const Size.fromHeight(55);
}
