import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Address with ChangeNotifier {
  String userId = '';

  set setUserID(String uID) {
    userId = uID;
  }

  final users = FirebaseFirestore.instance.collection('users');

  String _roomNumber = 'add address';
  String _street = 'add address';
  String _barangay = 'add address';
  String _city = 'add address';
  String _province = 'add address';
  String _moreDescription = 'add address';

  String get roomNumber => _roomNumber;
  String get street => _street;
  String get barangay => _barangay;
  String get city => _city;
  String get province => _province;
  String get moreDescription => _moreDescription;

  void readAddress() async {
    final snapshot = await users.doc(userId).get();
    if (snapshot.exists) {
      final jsonAddress = snapshot.data()!['address'];

      _roomNumber = jsonAddress['roomNumber'] ?? '';
      _street = jsonAddress['street'] ?? '';
      _barangay = jsonAddress['barangay'] ?? '';
      _province = jsonAddress['province'] ?? '';
      _moreDescription = jsonAddress['moreDescription'] ?? '';
    }
    notifyListeners();
  }

  void updateAddress(
      String formRoomNumber,
      String formStreet,
      String formBarangay,
      String formCity,
      String formProvince,
      String formDescription) {
    users.doc(userId).set({
      'address': {
        'roomNumber': formRoomNumber,
        'street': formStreet,
        'barangay': formBarangay,
        'city': formCity,
        'province': formProvince,
        'moreDescription': formDescription,
      }
    }, SetOptions(merge: true)).then((value) {
      // print('User Address Updated');
      _roomNumber = formRoomNumber;
      _street = formStreet;
      _barangay = formBarangay;
      _city = formCity;
      _province = formProvince;
      _moreDescription = formDescription;
    }).catchError((error) => print('Failed to add user address: $error'));

    notifyListeners();
  }
}
