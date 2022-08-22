import 'package:flutter/material.dart';

class UserState with ChangeNotifier {
  String _userID = '';

  String get getUserID => _userID;

  set setUserID(String id) {
    _userID = id;
  }
}
