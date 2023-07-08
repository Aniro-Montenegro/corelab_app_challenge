// ignore_for_file: prefer_final_fields

import 'package:corelab_app_challenge/model/product.dart';
import 'package:flutter/material.dart';

class FavoritesState extends ChangeNotifier {
  List<Product> _favorites = [];

  List<Product> get favorites => _favorites;

  void addFavorite(Product product) {
    if (!_favorites.contains(product)) {
      _favorites.add(product);
      notifyListeners();
    }
  }

  void removeFavorite(Product product) {
    _favorites.remove(product);
    notifyListeners();
  }
}
