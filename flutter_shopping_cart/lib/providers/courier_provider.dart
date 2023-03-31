import 'package:flutter/material.dart';

import '../model/courier_model.dart';


class CourierProvider with ChangeNotifier {

  final List<Courier> _couriers = [
    Courier(name: 'JNE', price: 8000),
    Courier(name: 'TIKI', price: 10000),
    Courier(name: 'POS Indonesia', price: 9000),
  ];


  Courier? _selectedCourier;

  List<Courier> get couriers => _couriers;

  Courier? get getSelectedCourier => _selectedCourier;

  CourierProvider() {
    _selectedCourier = _couriers.first;
  }

  void setSelectedCourier(Courier courier) {
    _selectedCourier = courier;
    notifyListeners();
  }

}