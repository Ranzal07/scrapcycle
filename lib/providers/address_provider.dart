// ignore_for_file: avoid_print, invalid_return_type_for_catch_error

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Address with ChangeNotifier {
  // String userId = '';

  // set setUserID(String uID) {
  //   userId = uID;
  // }

  final users = FirebaseFirestore.instance.collection('users');

  String _roomNumber = '';
  String _street = '';
  String _barangay = 'Brgy. Ampayon';
  String _city = 'Butuan City';
  String _moreDescription = '';

  String get roomNumber => _roomNumber;
  String get street => _street;
  String get barangay => _barangay;
  String get city => _city;
  String get moreDescription => _moreDescription;

  void readAddress(String uid) async {
    final snapshot = await users.doc(uid).get();
    if (snapshot.exists) {
      final jsonAddress = snapshot.data()!['address'];

      if (jsonAddress != null) {
        _roomNumber = jsonAddress['roomNumber'] ?? '';
        _street = jsonAddress['street'] ?? '';
        _barangay = jsonAddress['barangay'] ?? '';
        _moreDescription = jsonAddress['moreDescription'] ?? '';
      }
    }
    notifyListeners();
  }

  void updateAddress(
      String formRoomNumber,
      String formStreet,
      String formBarangay,
      String formCity,
      String formDescription,
      String uid) {
    users.doc(uid).set({
      'address': {
        'roomNumber': formRoomNumber,
        'street': formStreet,
        'barangay': formBarangay,
        'city': formCity,
        'moreDescription': formDescription,
      }
    }, SetOptions(merge: true)).then((value) {
      // print('User Address Updated');
      _roomNumber = formRoomNumber;
      _street = formStreet;
      _barangay = formBarangay;
      _city = formCity;
      _moreDescription = formDescription;
      notifyListeners();
    }).catchError((error) => print('Failed to add user address: $error'));
  }
}
