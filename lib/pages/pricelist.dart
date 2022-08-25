import 'package:flutter/material.dart';

class PriceListPage extends StatelessWidget {
    const PriceListPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Container(
                decoration: const BoxDecoration(  
                    color: Colors.white,                     
                ),
                child: const Text('Pending for Price List Page...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),   
        );
    }
}