import 'package:flutter/material.dart';

class HomeState with ChangeNotifier {
  int _selectedIndex = 0;
  int _errorCheck = 0;

  int get selectedIndex => _selectedIndex;
  int get errorCheck => _errorCheck;

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void changeError(int errorCode) {
    _errorCheck = errorCode;
    notifyListeners();
  }
}
