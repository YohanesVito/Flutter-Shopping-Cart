import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/screen/product.dart';

void main() {
  runApp(const ShoppingCartApp());
}

class ShoppingCartApp extends StatelessWidget {
  const ShoppingCartApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping-Cart',
      theme: ThemeData(primarySwatch: Colors.grey,),
      home: const Product(),
    );
  }
}

