import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final String itemName;
  final String examples;
  final String value;

  const Item(
      {Key? key,
      required this.itemName,
      required this.examples,
      required this.value})
      : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14.0),
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 149, 168, 153).withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(5, 0), // changes position of shadow
          ),
        ],
      ),
      child: Table(
        border: TableBorder.symmetric(
          inside: const BorderSide(color: Colors.black12),
        ),
        columnWidths: const {
          0: FlexColumnWidth(1.1),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(1),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              Text(
                widget.itemName,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.examples,
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                widget.value,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
