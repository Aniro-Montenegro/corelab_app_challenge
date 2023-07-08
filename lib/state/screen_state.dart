import 'package:flutter/material.dart';

class ScreenState extends ChangeNotifier {
  int indexScreen = 0;

  void setscreen(int index) {
    indexScreen = index;
    notifyListeners();
  }
}
