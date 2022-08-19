import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pricelist/appBars/appbar.dart';
import 'package:pricelist/appBars/profilebar.dart';
import 'package:pricelist/nav_bar.dart';
import 'package:pricelist/pages/pricelist.dart';
import 'package:pricelist/pages/profile.dart';
import 'package:pricelist/pages/schedule.dart';
import 'package:provider/provider.dart';
import 'package:pricelist/providers/category_provider.dart';
import 'package:pricelist/providers/address_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryState()),
        ChangeNotifierProvider(create: (_) => Address())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _bodyOptions = [
    const Schedule(),
    PriceList(),
    const Profile(),
  ];

  final List<PreferredSizeWidget?> _navBarOptions = [
    const AppBarScrapCycle(titleStr: 'Home'),
    const AppBarScrapCycle(titleStr: 'Price list'),
    const ProfileBar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _navBarOptions.elementAt(_selectedIndex),
      body: Center(
        child: _bodyOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff27AE60),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell_outlined),
            label: 'Price List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
