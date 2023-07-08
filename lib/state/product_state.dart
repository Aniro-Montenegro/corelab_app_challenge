import 'package:corelab_app_challenge/model/product.dart';
import 'package:flutter/material.dart';

class ProductState extends ChangeNotifier {
  late Product productSelect = Product.products[0];
  int idProductSelect = 0;
  ProductState();
  int get idProduct => idProductSelect;
  set setIndexProduct(int value) {
    idProductSelect = value;
  }

  Product get product => productSelect;
  set setProduct(int indexProductSelect) {
    for (var p in Product.products) {
      if (p.id == indexProductSelect) {
        productSelect = p;
      }
    }

    notifyListeners();
  }

  void addQuantity(int id) {
    for (var p in Product.products) {
      if (p.id == id) {
        productSelect = p;
        productSelect.quantity++;
      }
    }
    notifyListeners();
  }

  void removeQuantity(int id) {
    for (var p in Product.products) {
      if (p.id == id) {
        productSelect = p;
        if (p.quantity > 0) {
          productSelect.quantity--;
        }
      }
    }

    notifyListeners();
  }
}
