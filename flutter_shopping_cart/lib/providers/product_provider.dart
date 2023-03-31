import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductProvider with ChangeNotifier {


  double getTotalBayar(){
    return _total + _totalOngkir;
  }

  //total bayar
  double _total = 0;
  void addTotal(double total){
    _total+= total;
    notifyListeners();
  }

  void removeTotal(double total){
    if(_total > 0){
      _total-= total;
      notifyListeners();
    }
  }
  double get getTotal => _total;

  //Total Berat
  double _totalBerat = 0;
  double get getTotalBerat => _totalBerat.abs();

  void addProduct(int index){
    double berat = _listproduct[index].weight;
    _totalBerat += berat;
    _listproduct[index].quantity ++ ;
    addTotal(_listproduct[index].price);
    notifyListeners();
  }

  void removeProduct(int index){
    if(_listproduct[index].quantity > 0){
      double berat = _listproduct[index].weight;
      _totalBerat -= berat;
      _listproduct[index].quantity -- ;
      removeTotal(_listproduct[index].price);
      notifyListeners();
    }
  }

  double getSubTotalProduct(int index){
    double harga = _listproduct[index].price;
    int jumlah = _listproduct[index].quantity;

    return harga*jumlah;
  }

  //Total Ongkir
  double _totalOngkir = 0;

  double getTotalOngkir(double courierPrice){
    _totalOngkir = _totalBerat * courierPrice;
    return _totalOngkir;
  }

  //list product
  final List<ProductItems> _listproduct = [
    ProductItems(
      title: "Thronmax Mdrill Zero",
      pathImage: "assets/images/1.jpg",
      price: 500000,
      weight: 1.32,
    ),
    ProductItems(
      title: "HyperX SoloCast",
      pathImage: "assets/images/2.jpg",
      price: 900000,
      weight: 0.8,
    ),
    ProductItems(
      title: "Neumann TLM-102",
      pathImage: "assets/images/3.jpg",
      price: 14000000,
      weight: 4,
    ),
    ProductItems(
      title: "Soundtech 2.1",
      pathImage: "assets/images/4.jpg",
      price: 450000,
      weight: 1.53,
    ),
    ProductItems(
      title: "Fantech Leviosa MCX01",
      pathImage: "assets/images/5.jpg",
      price: 660000,
      weight: 0.9,
    ),
    ProductItems(
      title: "Fifine K678",
      pathImage: "assets/images/6.jpg",
      price: 780000,
      weight: 2.1,
    ),
  ];

  //getter
  List<ProductItems> get listproduct => _listproduct;
  int get count => _listproduct.length;

}