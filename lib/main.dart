import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrapcycle/widgets/tabview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scrapcycle/change_notifier/change_notifier.dart';

Future main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    
    runApp(
        ChangeNotifierProvider(
            create: (context) => ChangePage(),
            child: const HomePage(),
        ),
    );
}

class HomePage extends StatelessWidget {
    const HomePage({Key? key}) : super(key: key);

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                canvasColor: Colors.white,
                textTheme: GoogleFonts.interTextTheme(
                    Theme.of(context).textTheme,
                ),
                appBarTheme: const AppBarTheme(
                    color: Color(0xff27ae60),
                ),      
            ),
            home: const TabViewWidget(),     // this will call the TabViewClass for the Scaffold Widget to be displayed by each tab
            debugShowCheckedModeBanner: false,
        );
    }
}

