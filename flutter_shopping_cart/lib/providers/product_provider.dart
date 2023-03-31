import 'package:flutter/material.dart';

import '../model/productItems.dart';

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
  void addTotalBerat(double berat){
    _totalBerat+=berat;
    notifyListeners();
  }

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
  List<ProductItems> _listproduct = allProductItems;

  //getter
  List<ProductItems> get listproduct => _listproduct;
  int get count => _listproduct.length;

  //setter Quantity
  void incrementQuantity(int index) {
    _listproduct[index].quantity++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_listproduct[index].quantity > 0) {
      _listproduct[index].quantity--;
      notifyListeners();
    }
  }

  //get quantity
  int getQuantity(int index) {
    return _listproduct[index].quantity;
  }

  //get price
  double getPrice(int index) {
    return _listproduct[index].price;
  }

  //get weight
  double getWeight(int index) {
    return _listproduct[index].weight;
  }
}