import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/screen/cart.dart';
import '../model/productItems.dart';

class Product extends StatefulWidget {
  const Product({
    Key? key,
  }) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  //product
  List<ProductItems> products = allProductItems;

  //product quantity
  void navigateToCartScreen(BuildContext context) async {
    // create a copy of the products list
    List<ProductItems> copyProducts = List.from(products);

    // navigate to the CartScreen and pass the copy of the products list
    final updatedProducts = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(listProduct: copyProducts),
      ),
    );

    // update the state with the updated products list
    if (updatedProducts != null) {
      setState(() {
        products = updatedProducts;
      });
    }
  }

  void addQuantity(BuildContext context, ProductItems product) {
    product.count += 1;
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
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final item = products[index];
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
                      setState(() {
                        addQuantity(context, item);
                      });
                      //tambah jumlah ketika diklik
                    },
                  ),
                  Text(item.count.toString()),
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}
