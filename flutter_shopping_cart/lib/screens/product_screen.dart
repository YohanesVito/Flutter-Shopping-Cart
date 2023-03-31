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
        title: const Text("Product Menu", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToCartScreen(context);
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.shopping_cart),
      ),
      body: Column(
        children: [
          // LIST PRODUCT
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
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item.pathImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      item.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${item.weight}kg",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.green,
                      onPressed: () {
                        // ubah provider
                        context.read<ProductProvider>().addProduct(index);
                      },
                    ),
                    Text(
                      item.quantity.toString(),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
