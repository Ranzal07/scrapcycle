import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
    const ProfilePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Container(
                decoration: const BoxDecoration(  
                    color: Colors.white,                     
                ),
                child: const Text('Pending for Profile Page...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),   
        );
    }
}