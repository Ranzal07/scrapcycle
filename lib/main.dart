import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pricelist/appBars/appbar.dart';
import 'package:pricelist/appBars/homebar.dart';
import 'package:pricelist/appBars/profilebar.dart';
import 'package:pricelist/pages/body.dart';
import 'package:pricelist/pages/pending.dart';
import 'package:pricelist/pages/pricelist.dart';
import 'package:pricelist/pages/profile.dart';
import 'package:pricelist/pages/schedule.dart';
import 'package:pricelist/providers/change_notifier.dart';
import 'package:pricelist/providers/home_provider.dart';
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
        ChangeNotifierProvider(create: (_) => Address()),
        ChangeNotifierProvider(create: (_) => HomeState()),
        ChangeNotifierProvider(create: (_) => ChangePage()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const Home(),
      ),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    context.read<ChangePage>().checkComplete();

    final List<Widget> bodyOptions = [
      context.watch<ChangePage>().isCompleted == true
          ? const BodyPage()
          : const PendingPage(),
      PriceList(),
      const Profile(),
    ];

    final List<PreferredSizeWidget?> navBarOptions = [
      const HomeBar(),
      const AppBarScrapCycle(titleStr: 'Price list'),
      const ProfileBar(),
    ];
    int pageIndex = context.watch<HomeState>().selectedIndex;

    void onItemTapped(int index) {
      context.read<HomeState>().changeIndex(index);
    }

    return Scaffold(
      appBar: navBarOptions.elementAt(pageIndex),
      body: Center(
        child: bodyOptions.elementAt(pageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff27AE60),
        items: const [
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
        currentIndex: pageIndex,
        selectedItemColor: Colors.white,
        onTap: (int index) => onItemTapped(index),
      ),
    );
  }
}
