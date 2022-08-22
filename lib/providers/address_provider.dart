import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Address with ChangeNotifier {
  String userId = '';

  set setUserID(String uID) {
    userId = uID;
  }

  final docAddress = FirebaseFirestore.instance.collection('address');

  String _roomNumber = '';
  String _street = '';
  String _barangay = '';
  String _city = '';
  String _province = '';
  String _moreDescription = '';

  String get roomNumber => _roomNumber;
  String get street => _street;
  String get barangay => _barangay;
  String get city => _city;
  String get province => _province;
  String get moreDesccription => _moreDescription;

  void readAddress() async {
    final snapshot = await docAddress.doc(userId).get();
    if (snapshot.exists) {
      _roomNumber = snapshot.data()!['roomNumber'] ?? '';
      _street = snapshot.data()!['street'] ?? '';
      _barangay = snapshot.data()!['barangay'] ?? '';
      _city = snapshot.data()!['city'] ?? '';
      _province = snapshot.data()!['province'] ?? '';
      _moreDescription = snapshot.data()!['moreDescription'] ?? '';
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
    docAddress.doc(userId).set({
      'roomNumber': formRoomNumber,
      'street': formStreet,
      'barangay': formBarangay,
      'city': formCity,
      'province': formProvince,
      'moreDescription': formDescription,
    }).then((value) {
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
