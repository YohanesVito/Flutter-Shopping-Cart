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
        title: const Text("Shopping Cart",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: context.watch<ProductProvider>().count,
                itemBuilder: (context, index) {
                  final item = context.watch<ProductProvider>().listproduct[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            item.pathImage,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Harga: Rp${item.price}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        //tambah jumlah ketika diklik
                                        context.read<ProductProvider>().addProduct(index);
                                      },
                                    ),
                                    Text(
                                      item.quantity.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
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
                                const SizedBox(height: 8),
                                Text(
                                  "Sub Total: Rp${context.read<ProductProvider>().getSubTotalProduct(index)}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButton(
                      value: context.watch<CourierProvider>().getSelectedCourier,
                      isExpanded: true,
                      items: context.watch<CourierProvider>().couriers.map((Courier courier) {
                        return DropdownMenuItem<Courier>(
                          value: courier,
                          child: Text(
                            "${courier.name} -- Rp${courier.price}/kg",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (Courier? value) {
                        context.read<CourierProvider>().setSelectedCourier(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "Berat: ${context.read<ProductProvider>().getTotalBerat.toStringAsFixed(2)}kg",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Bayar Kurir:",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Rp${context.read<ProductProvider>().getTotalOngkir(context.watch<CourierProvider>().getSelectedCourier!.price).abs().toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Barang:",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Rp${context.read<ProductProvider>().getTotal}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Bayar:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rp${context.read<ProductProvider>().getTotalBayar().abs().toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
      ]),
    );
  }
}
