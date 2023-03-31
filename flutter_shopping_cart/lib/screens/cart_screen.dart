import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/providers/courier_provider.dart';
import 'package:provider/provider.dart';

import '../model/courier_model.dart';
import '../providers/product_provider.dart';

class CartScreen extends StatefulWidget {

  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text("Shopping Cart")),
      body: Column(children: [
        Flexible(
            child: ListView.builder(
                itemCount: context.watch<ProductProvider>().count,
                itemBuilder: (context, index) {
                  final item = context.watch<ProductProvider>().listproduct[index];
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
                              Text("Jumlah ${item.quantity}"),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      //tambah jumlah ketika diklik
                                      context.read<ProductProvider>().addProduct(index);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      //kurangi jumlah ketika diklik
                                        context.read<ProductProvider>().removeProduct(index);
                                    },
                                  ),
                                ],
                              ),
                            ]),
                            Text("Sub Total: Rp${context.read<ProductProvider>().getSubTotalProduct(index)}"),
                          ],
                        ),
                      ]));
                })),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 16, 20),
          child: Row(children: [
            DropdownButton(
              value: context.watch<CourierProvider>().getSelectedCourier,
              items: context.watch<CourierProvider>().couriers.map((Courier courier) {
                return DropdownMenuItem<Courier>(
                  value: courier,
                  child: Text("${courier.name} -- Rp${courier.price}"),
                );
              }).toList(),
              onChanged: (Courier? value) {
                context.read<CourierProvider>().setSelectedCourier(value!);
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,8,8,8),
              child: Text("Berat: ${context.read<ProductProvider>().getTotalBerat.toStringAsFixed(2)}"),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8,8,8,8),
          child: Text("Total Bayar Kurir: Rp${context.read<ProductProvider>().getTotalOngkir(context.watch<CourierProvider>().getSelectedCourier!.price).abs().toStringAsFixed(2)}"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8,8,8,8),
          child: Text("Total Barang: Rp${context.read<ProductProvider>().getTotal}"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8,8,8,50),
          child: Text("Total Bayar: Rp${context.read<ProductProvider>().getTotalBayar().abs().toStringAsFixed(2)}"),
        ),
      ]),
    );
  }
}
