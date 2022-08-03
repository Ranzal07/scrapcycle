import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pricelist/appbar.dart';
import 'package:pricelist/buttons/category.dart';

class PriceList extends StatefulWidget {
  PriceList({Key? key}) : super(key: key);

  @override
  State<PriceList> createState() => _PriceListState();
}

enum SingingCharacter { lafayette, jefferson }

class _PriceListState extends State<PriceList> {
  Color myColor = const Color.fromARGB(255, 39, 174, 95);
  Color darkGrey = const Color(0xff828282);
  SingingCharacter? _character = SingingCharacter.lafayette;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CategoryBtn(categoryName: 'Plastic'),
                CategoryBtn(categoryName: 'Glass'),
                CategoryBtn(categoryName: 'Metal'),
                CategoryBtn(categoryName: 'Carton'),
                CategoryBtn(categoryName: 'E-Waste'),
              ],
            ),
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
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 14.0),
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 149, 168, 153)
                        .withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(5, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                              width: 1.0,
                              color: Color.fromARGB(140, 224, 224, 224)),
                        ),
                      ),
                      child: Text(
                        'Plastic cups',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: const Color(0xff219653),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        border: Border(
                          right: BorderSide(
                              width: 1.0,
                              color: Color.fromARGB(140, 224, 224, 224)),
                        ),
                      ),
                      child: Text(
                        'Items',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: const Color(0xff4F4F4F),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '3.00 / kg',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: const Color(0xff4F4F4F),
                        fontSize: 14.0,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
