import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/category_name_provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/providers/category_provider.dart';
import 'package:store/services/router_service.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CategoryProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CategoryNameProvider(),
      ),
      ChangeNotifierProvider(
          create: (context) => CartProvider(),
      )
    ],
    child: const Store(),
  ),
);

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Store",
      routerConfig: RouterService.getRouter(),
    );
  }
}
