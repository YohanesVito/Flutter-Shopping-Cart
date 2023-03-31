import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/providers/courier_provider.dart';
import 'package:flutter_shopping_cart/providers/product_provider.dart';
import 'package:flutter_shopping_cart/screens/cart_screen.dart';
import 'package:flutter_shopping_cart/screens/product_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_) => CourierProvider())
    ],
    child: const ShoppingCartApp(),
  ));
}

class ShoppingCartApp extends StatelessWidget {
  const ShoppingCartApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'Shopping-Cart',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routes: {
        '/': (context) => const ProductScreen(),
        '/cart': (context) => const CartScreen()
      },
    );
  }
}
