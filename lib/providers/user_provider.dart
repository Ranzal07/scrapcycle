import 'package:flutter/material.dart';

class UserState with ChangeNotifier {
  String _userID = '';
  String? _userName = '';

  String get getUserID => _userID;
  String? get getUserName => _userName;

  set setUserID(String id) {
    _userID = id;
  }

  set setUserName(String? name) {
    _userName = name;
  }
}
