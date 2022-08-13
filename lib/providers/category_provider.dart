import 'package:flutter/material.dart';

class CategoryState with ChangeNotifier {
  int _currentType = 1;

  int get currentType => _currentType;

  void setType(int newType) {
    _currentType = newType;
    notifyListeners();
  }
}
