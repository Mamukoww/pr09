import 'package:flutter/material.dart';

class ProductManager extends ChangeNotifier {
  List<String> _products = ['Помидор', 'Огурец', 'Апельсин', 'Мандарин'];

  List<String> get products => List.unmodifiable(_products);

  void addProduct(String product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }
}
