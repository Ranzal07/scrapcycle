import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget{
    const AppBarWidget({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return AppBar(
            toolbarHeight: 50,
            toolbarOpacity: 1,
            centerTitle: true,   
            title: const Text('Collection Enlistment'),            
            actions: [
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Image.asset('assets/images/logo.png'),
                ),
            ],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                ),
            ),
            
            bottom: PreferredSize( 
                preferredSize: const Size.fromHeight(30.0), // here the desired height
                child: Center(
                    child: Container(     
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.white,
                        ),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                                Text("Blk 1 Lot 24 IRA Subd. Brgy. Baan Km. 3", style: TextStyle(fontSize: 15)),
                                SizedBox(width: 7),
                                Icon(Icons.my_location, size: 18),
                            ],
                        )           
                    ),                    
                )
            ),
        );
    }
    
    @override
    Size get preferredSize => const Size.fromHeight(100.0);
}