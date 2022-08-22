import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pricelist/homepage_classes/add_to_database.dart';
import 'package:provider/provider.dart';
import 'package:pricelist/providers/home_provider.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  DateTime date = DateTime.now();
  Stream<DocumentSnapshot> getSchedDate = FirebaseFirestore.instance
      .collection('collection-date')
      .doc('Admin')
      .snapshots(); // DocumentID: 'Admin'     Document Field: schedule-date: <timestamp> value

  List<String> plastics = [
    "Plastic Bottles",
    "Plastic Cups",
    "Water Bottles",
    "Coke Mismo",
    "Sprite Mismo",
    "250ml Royal Bottle",
    "Monobloc Chairs",
    "Hangers",
    "Shampoo Bottles",
    "Water Jugs",
    "1.5 Litres Beverage"
  ];

  List<String> glasses = [
    "Kulafu",
    "Tanduay",
    "Garapa",
    "Ketchup",
    "Mallorca",
    "Coke Litro",
    "Kasalo/Pepsi",
    "RedHorse Litro",
    "Coke Litro w/ Case",
    "Pepsi Litro w/ Case",
    "RedHorse Litro w/ Case",
    "Coke Small",
    "Pepsi Small",
    "Cobra",
    "RedHorse Small",
  ];

  List<String> metals = [
    "Assorted",
    "Solid",
    "Light Bulbs (Pundido)",
    "Tin Can",
    "Sin Roof",
    "Alloy (Mixed)",
    "Cooking Pot",
    "Aluminum Can",
    "Lead",
    "Copper",
    "Brass",
    "Light/Thin Metals",
    "Heavy/Thick Metals",
    "Steel Plate Metal",
    "Sardines Can",
    "Tuna Can",
    "Corrugated Roofing Material",
    "Steel/Bronze",
    "Steel/Bronze (Mixed)",
    "Caldero",
    "Beverage Cans",
    "Spray Cans",
    "Lead Sinker (Tingga)",
    "Copper Tubing",
    "Wlectric Cords",
    "Locks",
    "Hinges",
    "Zippers",
    "Drawer Knobs",
  ];

  List<String> batteries = [
    "Motorcycle Battery",
    "Car Battery",
    "MCB",
    "5 Plates",
    "7 Plates",
    "9 Plates",
    "11 Plates",
    "13 Plates",
    "17 Plates",
    "21 Plates",
  ];

  List<String> electronics = [
    "TV Board",
    "M2",
    "Single Check",
    "Double",
    "Radiator",
  ];

  String extractWeekday(int weekdayNum) {
    String weekday = '';

    switch (weekdayNum) {
      case 1:
        weekday = 'Mon';
        break;
      case 2:
        weekday = 'Tue';
        break;
      case 3:
        weekday = 'Wed';
        break;
      case 4:
        weekday = 'Thur';
        break;
      case 5:
        weekday = 'Fri';
        break;
      case 6:
        weekday = 'Sat';
        break;
      case 7:
        weekday = 'Sun';
        break;
      default:
    }

    return weekday;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Next scrap collection date:',
                    style: GoogleFonts.inter(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                StreamBuilder<DocumentSnapshot>(
                    stream: getSchedDate,
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        Map<String, dynamic> dateSnapshot =
                            snapshot.data!.data() as Map<String, dynamic>;
                        DateTime scheduleDate =
                            dateSnapshot['schedule-date'].toDate();
                        date = scheduleDate;
                        return Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '${DateFormat('MMMM').format(scheduleDate)} ${scheduleDate.day}, ${extractWeekday(scheduleDate.weekday)}',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: const Color(0xff219653),
                            ),
                          ),
                        );
                      }
                      return Container();
                    }),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Center(
                                child: Text(
                                  'Confirm your collection?',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              content: const SingleChildScrollView(
                                child: Text(
                                    'By confirming this, you agree that ScrapCycle will collect your scraps on the day shown in the screen'),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Back',
                                      style: TextStyle(color: Colors.red)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    AddToDatabase.dataSend(
                                        context, date, widget.id);
                                  },
                                  child: const Text('Confirm',
                                      style: TextStyle(color: Colors.green)),
                                ),
                              ],
                              elevation: 25,
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF27AE60),
                      onSurface: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 50.0,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Collect My Scraps! ',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Image.asset("assets/images/truck.png", scale: 0.8),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'We buy:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<HomeState>().changeIndex(1);
                            },
                            child: const Text(
                              'See the selling price ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: Color(0XFF219653),
                              ),
                            ),
                          ),
                          const Text(
                            '₱',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF219653),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Plastics:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 10,
                  children: [
                    for (var i in plastics)
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                        child: Text(i, style: const TextStyle(fontSize: 15)),
                      ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Glasses:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 10,
                  children: [
                    for (var i in glasses)
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                        child: Text(i, style: const TextStyle(fontSize: 15)),
                      ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Metals:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 10,
                  children: [
                    for (var i in metals)
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                        child: Text(i, style: const TextStyle(fontSize: 15)),
                      ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Batteries:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 10,
                  children: [
                    for (var i in batteries)
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                        child: Text(i, style: const TextStyle(fontSize: 15)),
                      ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Electronics:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 10,
                  children: [
                    for (var i in electronics)
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                        child: Text(i, style: const TextStyle(fontSize: 15)),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 150.0,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/playground.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
