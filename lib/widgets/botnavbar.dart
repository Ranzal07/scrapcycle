import 'package:flutter/material.dart';

class BotNavWidget extends StatelessWidget {
    const BotNavWidget({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return const BottomAppBar(
            color: Color.fromARGB(255, 223, 245, 234),
            child: TabBar(
                unselectedLabelColor: Colors.black,
                labelPadding: EdgeInsets.fromLTRB(0,0,0,0),
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 5.0, color: Color(0xFF27AE60)),
                ),
                labelColor: Color(0xFF27AE60),
                tabs: [
                    Tab(text: "Home", icon: Icon(Icons.home)),
                    Tab(text: "Price List", icon: ImageIcon(AssetImage("assets/images/peso.png"))),
                    Tab(text: "Profile", icon: Icon(Icons.person)),
                ],
            ),  
        );
    }
}
