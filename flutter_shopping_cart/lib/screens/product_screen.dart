import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/providers/product_provider.dart';
import 'package:flutter_shopping_cart/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  //navigation
  void navigateToCartScreen(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Menu"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToCartScreen(context);
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.shopping_cart),
      ),
      body: Column(children: [
        //LIST PRODUCT
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.only(top: 15),
            itemCount: context.watch<ProductProvider>().count,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final item = context.watch<ProductProvider>().listproduct[index];
              return Column(
                children: [
                  Expanded(
                      child: Image.asset(
                    item.pathImage,
                    fit: BoxFit.cover,
                  )),
                  Text(item.title),
                  Text("${item.weight}kg"),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      //ubah provider
                      context.read<ProductProvider>().addProduct(index);
                    },
                  ),
                  Text(item.quantity.toString()),
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}
