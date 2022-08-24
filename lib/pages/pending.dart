import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PendingPage extends StatelessWidget {
  const PendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot> getSchedDate = FirebaseFirestore.instance
        .collection('collection-date')
        .doc('Admin')
        .snapshots();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Container(
            height: 110,
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/pending-truck.png"),
              ),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Your collection schedule has been successfully placed!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: Color(0xff1A535C),
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
                DateTime scheduleDate = dateSnapshot['schedule-date'].toDate();
                return Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Our scrap collector will arrive soon to collect your recyclables on ${DateFormat('MMMM').format(scheduleDate)} ${scheduleDate.day}, ${scheduleDate.year}.\nThank you for your environmental efforts, scrapper!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xff1A535C),
                    ),
                  ),
                );
              }
              return Container();
            }),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Note: Please wait for your scraps to be collected \nfor your next transaction.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff1A535C),
              ),
            ),
          ),
        ),
        // ElevatedButton(
        //   onPressed: () {},
        //   style: ElevatedButton.styleFrom(
        //     primary: const Color(0xFF27AE60),
        //     onSurface: Colors.black,
        //     shape: const RoundedRectangleBorder(
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(15),
        //       ),
        //     ),
        //     padding: const EdgeInsets.symmetric(
        //       vertical: 15.0,
        //       horizontal: 50.0,
        //     ),
        //   ),
        //   child: Text(
        //     'Cancel Schedule',
        //     style: GoogleFonts.inter(
        //       fontSize: 18,
        //       fontWeight: FontWeight.w600,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        const Spacer(),
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
