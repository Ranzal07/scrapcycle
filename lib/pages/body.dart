import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pricelist/pages/set_address.dart';
import 'package:pricelist/providers/address_provider.dart';
import 'package:pricelist/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:pricelist/providers/home_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

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

  // DateTime datetime
  DateTime datetime = DateTime.now();

  void dataSend(BuildContext ctx) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return;
    }

    var users = FirebaseFirestore.instance.collection('users');
    var schedule = FirebaseFirestore.instance.collection('schedule');
    // var address = FirebaseFirestore.instance.collection('address');
    String userID = context.read<UserState>().getUserID;

    // DocumentID: 'Admin'     Document Field: schedule-date: <timestamp> value
    int day = datetime.day;
    int month = datetime.month;
    int year = datetime.year;
    DateTime dateOfSubscription = DateTime.now();

    String dateID = '$day-$month-$year';
    int numOfDocs = 1;

    // get user address
    // print(address.doc(userID).get());
    schedule.get().then((querySnapshot) {
      // print('number of docs');
      numOfDocs = querySnapshot.size + 1;
    });

    // TODO:add to schedule
    // context.read<Address>().readAddress();

    try {
      await schedule.doc(dateID).collection('user-$numOfDocs').doc(userID).set({
        'id': userID,
        'dateOfSubscription': dateOfSubscription,
      }).then((value) {
        users
            .doc(ctx.read<UserState>().getUserID)
            .update({'completed?': false});
      });
      // Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('dfgdfgdf'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Next scrap collection date:',
                    style: GoogleFonts.inter(
                      fontSize: 17.0,
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
                        datetime = scheduleDate;

                        String scheduleDisplay = dateSnapshot['displayString'];

                        return Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            scheduleDisplay,
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
                            if (context.read<Address>().roomNumber != '') {
                              return AlertDialog(
                                title: const Center(
                                  child: Text(
                                    'Confirm your collection?',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('dfgdfgdf'),
                                          duration: Duration(seconds: 3),
                                        ),
                                      );
                                      dataSend(context);
                                    },
                                    child: const Text('Confirm',
                                        style: TextStyle(color: Colors.green)),
                                  ),
                                ],
                                elevation: 25,
                              );
                            }

                            return AlertDialog(
                              title: const Center(
                                child: Text(
                                  'Set your address to continue',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
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
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SetAddress()),
                                    );
                                  },
                                  child: const Text('Ok',
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
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "ScrapCycle buys your recyclables when you set a schedule by clicking the",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: " 'Collect My Scraps' ",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xff219653),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text:
                              "button from the comfort of your home at the collection date shown.",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
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


// dialogs

// class ConfirmationAlert extends StatelessWidget {
//   const ConfirmationAlert({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return return AlertDialog(
//                               title: const Center(
//                                 child: Text(
//                                   'Confirm your collection?',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               content: const SingleChildScrollView(
//                                 child: Text(
//                                     'By confirming this, you agree that ScrapCycle will collect your scraps on the day shown in the screen'),
//                               ),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   child: const Text('Back',
//                                       style: TextStyle(color: Colors.red)),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     dataSend();
//                                   },
//                                   child: const Text('Confirm',
//                                       style: TextStyle(color: Colors.green)),
//                                 ),
//                               ],
//                               elevation: 25,
//                             );
//   }
// }