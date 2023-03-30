import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/model/courier.dart';
import 'package:flutter_shopping_cart/model/pro'
    'ductItems.dart';

class CartScreen extends StatefulWidget {
  final List<ProductItems> listProduct;

  const CartScreen({
    Key? key,
    required this.listProduct,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  String dropdownValue = "SiPecat Rp8000";

  List<Courier> couriers = allCouriers;
  Courier selectedCourier = allCouriers.first;

  var totalharga = 0;
  var totalKurir = 0.0;
  var totalBerat = 0.0;

  void addQuantity(BuildContext context, ProductItems product) {
    product.count += 1;

  }

  void removeQuantity(BuildContext context, ProductItems product) {
    product.count -= 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context, widget.listProduct);
            },
          ),
          title: Text("Shopping Cart")),
      body: Column(children: [
        Flexible(
            child: ListView.builder(
                itemCount: widget.listProduct.length,
                itemBuilder: (context, index) {
                  final item = widget.listProduct[index];
                  return Card(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Row(
                          children: [
                            Image.asset(
                              item.pathImage,
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            ),
                            Column(children: [
                              Text(item.title),
                              Text("Harga: Rp${item.price}"),
                              Text("Jumlah ${item.count}"),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      //tambah jumlah ketika diklik
                                      setState(() {
                                        addQuantity(context, item);
                                        totalharga += item.price;
                                        totalBerat += item.weight;
                                        totalKurir = totalBerat*selectedCourier.price;
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      //kurangi jumlah ketika diklik
                                      setState(() {
                                        removeQuantity(context, item);
                                        totalharga -= item.price;
                                        totalBerat -= item.weight;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ]),
                            Text("Total: Rp${item.count * item.price}"),
                          ],
                        ),
                      ]));
                })),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 16, 20),
          child: Row(children: [
            DropdownButton(
              value: selectedCourier,
              items: couriers.map((Courier courier) {
                return DropdownMenuItem<Courier>(
                  value: courier,
                  child: Text("${courier.name} -- Rp${courier.price}"),
                );
              }).toList(),
              onChanged: (Courier? value) {
                setState(() {
                  selectedCourier = value!;
                  totalKurir = totalBerat*selectedCourier.price;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,8,8,8),
              child: Text("Berat: $totalBerat"),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8,8,8,8),
          child: Text("Total Barang: Rp${totalharga}"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8,8,8,8),
          child: Text("Total Bayar Kurir: Rp${totalKurir}"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8,8,8,100),
          child: Text("Total Bayar: Rp${totalharga+totalKurir}"),
        ),

      ]),
    );
  }
}
