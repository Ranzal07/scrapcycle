import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pricelist/appbar.dart';
import 'package:pricelist/category_bar.dart';
import 'package:pricelist/firebase_crud.dart';
import 'package:pricelist/item.dart';
import 'package:pricelist/models/price.dart';

class PriceList extends StatefulWidget {
  PriceList({Key? key}) : super(key: key);

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  final Stream<QuerySnapshot> collectionReference =
      FirebaseCrud.readPricelist();

  Color myColor = const Color.fromARGB(255, 39, 174, 95);
  Color darkGrey = const Color(0xff828282);

  List<String> itemNames = ["plastic cups", "cartons", "PET bottles"];
  List<String> examples = [
    "plastic cups, hsdjklfjsd, sjdfgkf, sadlifhailsfd",
    "cartons, sjdkfgksdf, sadfghksdf, sajkfdgsdf",
    "PET bottles, jsadgff, sjdfksadf, askjdguasgd"
  ];
  List<String> values = ["3.00 / kg", "12.00 / kg", "10.00 / kg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarScrapCycle(titleStr: 'price list'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        color: const Color(0xffFAFCFB),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.payments,
                  size: 28,
                  color: Color(0xff828282),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 24.0, bottom: 24.0),
                  child: Text(
                    'See how much you’ll earn for your scraps',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff828282),
                    ),
                  ),
                ),
              ],
            ),
            CategoryBar(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: SizedBox(
                height: 10.0,
                child: Center(
                  child: Container(
                    margin:
                        const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                    height: 1.0,
                    color: const Color(0xffE0E0E0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Items',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: const Color(0xff4F4F4F),
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Examples',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: const Color(0xff4F4F4F),
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Value',
                          style: GoogleFonts.inter(
                            color: const Color(0xff4F4F4F),
                            fontSize: 14.0,
                          ),
                        ),
                        const Icon(
                          Icons.sell_outlined,
                          size: 18.0,
                          color: Color(0xff4F4F4F),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: itemNames.length,
                itemBuilder: ((context, index) {
                  return Item(
                    examples: examples[index],
                    itemName: itemNames[index],
                    value: values[index],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
