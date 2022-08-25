import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddToDatabase{
    static void dataSend(BuildContext context, DateTime sched) async {
        DateTime datetime = DateTime.now();
        var users = FirebaseFirestore.instance.collection('scrapcycle-users');      // DocumentID: 'Admin'     Document Field: schedule-date: <timestamp> value
        String name = 'Lavranz';
        Map<String, dynamic> data = {      
            'name': name,
            'schedule-date': sched,
            'completed?' : false,
            'time' : datetime,
        };
        users.doc(name).set(data);                               
        Navigator.pop(context);
    }
}