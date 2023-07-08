import 'package:corelab_app_challenge/model/product.dart';
import 'package:flutter/material.dart';

class ShoppingCartState extends ChangeNotifier {
  List<Product> _products = [];
  double _total = 0;

  List<Product> get products => _products;
  double get total => _total;

  void addProduct(Product product) {
    if (_products.contains(product)) {
      return;
    }
    _products.add(product);
    _total += product.price;
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.remove(product);
    _total -= product.price;
    notifyListeners();
  }

  void clearCart() {
    _products = [];
    _total = 0;
    notifyListeners();
  }
}
