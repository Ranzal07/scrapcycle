import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChangePage with ChangeNotifier {
  bool isCompleted = true; // Assuming the transaction is complete;

  void checkComplete(String id) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    //  change the DocumentID [doc('')] according to the username
    isCompleted = documentSnapshot['completed?'] ?? true;
    notifyListeners();
  }
}
