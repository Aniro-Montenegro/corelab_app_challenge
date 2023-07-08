import 'package:corelab_app_challenge/model/product.dart';
import 'package:flutter/material.dart';

class CategoryState extends ChangeNotifier {
  String _selectedCategory = 'Todos';
  String _search = '';
  final List<Product> _products = Product.products;
  List<Product> _productsFiltered = Product.products;

  List<Product> get productsFiltered => _productsFiltered;

  String get selectedCategory => _selectedCategory;
  String get search => _search;

  CategoryState();

  set selectedCategory(String value) {
    _selectedCategory = value;

    filterListFromCategory(_selectedCategory);
  }

  void filterList(String value) {
    _search = value;
    if (value.isNotEmpty) {
      List<Product> tempList = [];
      _productsFiltered = [];
      for (var product in _products) {
        if (product.name.toLowerCase().contains(value.toLowerCase()) ||
            product.description.toLowerCase().contains(value.toLowerCase()) ||
            product.category.toLowerCase().contains(value.toLowerCase()) ||
            product.price.toString().contains(value)) {
          tempList.add(product);
        }
      }

      _productsFiltered = tempList;
      notifyListeners();
    } else {
      _productsFiltered = _products;
      notifyListeners();
    }
  }

  void filterListFromCategory(String value) {
    _search = value;
    if (value == 'Todos') {
      _productsFiltered = _products;
      notifyListeners();
      return;
    } else if (value.isNotEmpty) {
      List<Product> tempList = [];
      _productsFiltered = [];
      for (var product in _products) {
        if (product.category.toLowerCase().contains(value.toLowerCase())) {
          tempList.add(product);
        }
      }

      _productsFiltered = tempList;
      notifyListeners();

      return;
    } else {
      _productsFiltered = _products;
      notifyListeners();
    }
  }

  refresh() {
    _search = '';
    _selectedCategory = 'Todos';
    _productsFiltered = Product.products;
    notifyListeners();
  }
}
