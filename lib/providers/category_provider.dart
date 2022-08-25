import 'package:flutter/material.dart';

class CategoryState with ChangeNotifier {
  int _currentType = 1;
  List<String> _itemNames = [
    "Kulafu",
    "Tanduay",
    "Garapa",
    "Ketchup",
    "Mallorca",
    "Coke Litro",
    "Kasalo/Pepsi",
    "RedHorse Litro",
    "Coke Litro w/ case",
    "Pepsi Litro w/ case",
    "RedHorse Litro w/ case",
    "Coke small",
    "Pepsi small",
    "Cobra",
    "RedHorse small",
  ];

  List<String> _values = [
    "0.50 / piece",
    "0.75 / piece",
    "0.60 / piece",
    "0.15 / piece",
    "0.15 / piece",
    "1.00 / piece",
    "1.00 / piece",
    "0.50 / piece",
    "35.00 / set",
    "35.00 / set",
    "35.00 / set",
    "0.15 / piece",
    "0.15 / piece",
    "0.15 / piece",
    "0.35 / piece",
  ];

  List<String> _examples = [
    "Liquor bottle",
    "Liquor bottle",
    "Efficascent oil bottle, etc.",
    "UFC ketchup glass bottle",
    "Liquor bottle",
    "Liquor bottle",
    "Liquor bottle",
    "Liquor bottle",
    "Liquor bottle w/ plastic case",
    "Liquor bottle w/ plastic case",
    "Liquor bottle w/ plastic case",
    "Liquor bottle",
    "Liquor bottle",
    "Liquor bottle",
    "Liquor bottle",
  ];

// plastics
  List<String> itemNames2 = [
    "low density plastic",
    "high density plastic",
    "plastic bottle 1 litre",
  ];
  List<String> examples2 = [
    "plastic cups, water bottles, coke mismo, sprite mismo, 250ml royal bottle, etc.",
    "monobloc chairs, hangers, shampoo bottles, water jugs, etc.",
    "1.5 litres beverage plastic bottles",
  ];
  List<String> values2 = [
    "1.50 / kg",
    "2.00 / kg",
    "0.50 / kg",
  ];

// glass
  List<String> itemNames1 = [
    "Kulafu",
    "Tanduay",
    "Garapa",
    "Ketchup",
    "Mallorca",
    "Coke Litro",
    "Kasalo/Pepsi",
    "RedHorse Litro",
    "Coke Litro w/ case",
    "Pepsi Litro w/ case",
    "RedHorse Litro w/ case",
    "Coke small",
    "Pepsi small",
    "Cobra",
    "RedHorse small",
  ];

  List<String> examples1 = [
    "Liquor bottle",
    "Liquor bottle",
    "Efficascent oil bottle, etc.",
    "UFC ketchup glass bottle",
    "Liquor bottle",
    "Liquor bottle",
    "Liquor bottle",
    "Liquor bottle",
    "Liquor bottle w/ plastic case",
    "Liquor bottle w/ plastic case",
    "Liquor bottle w/ plastic case",
    "Liquor bottle",
    "Liquor bottle",
    "Liquor bottle",
    "Liquor bottle",
  ];

  List<String> values1 = [
    "0.50 / piece",
    "0.75 / piece",
    "0.60 / piece",
    "0.15 / piece",
    "0.15 / piece",
    "1.00 / piece",
    "1.00 / piece",
    "0.50 / piece",
    "35.00 / set",
    "35.00 / set",
    "35.00 / set",
    "0.15 / piece",
    "0.15 / piece",
    "0.15 / piece",
    "0.35 / piece",
  ];

// metal
  List<String> itemNames3 = [
    "assorted",
    "solid",
    "light",
    "light bulb",
    "tin can",
    "sin roof",
    "alloy",
    "alloy mixed",
    "cooking pot",
    "aluminum can",
    "lead",
    "copper",
    "brass",
  ];
  List<String> examples3 = [
    "light/thin metals",
    "heavy/thick metals",
    "steel plate metal",
    "light bulbs (pundido)",
    "sardines can, tuna can, etc.",
    "corrugated roofing material",
    "steel/bronze",
    "steel/bronze mixed with other materials",
    "caldero",
    "beverage cans, spray cans, etc.",
    "lead sinker (tingga)",
    "copper tubing, electric cords, etc.",
    "locks, hinges, zippers, drawer knobs, etc.",
  ];
  List<String> values3 = [
    "7.50 / kg",
    "8.00 / kg",
    "4.00 / kg",
    "3.50 / kg",
    "2.00 / kg",
    "2.50 / kg",
    "22.5 / kg",
    "15.00 / kg",
    "15.00 / kg",
    "15.00 / kg",
    "20.00 / kg",
    "170.00 / kg",
    "100.00 / kg",
  ];

// battery
  List<String> itemNames4 = [
    "MCB",
    "5 plates",
    "7 plates",
    "9 plates",
    "11 plates",
    "13 plates",
    "17 plates",
    "21 plates",
  ];
  List<String> examples4 = [
    "motorcycle battery",
    "car battery",
    "car battery",
    "car battery",
    "car battery",
    "car battery",
    "car battery",
    "car battery",
  ];
  List<String> values4 = [
    "12.50 / piece",
    "75.00 / piece",
    "150.00 / piece",
    "200.00 / piece",
    "250.00 / piece",
    "300.00 / piece",
    "450.00 / piece",
    "500.00 / piece",
  ];

// electronics
  List<String> itemNames5 = [
    "TV board",
    "M2",
    "single check",
    "double",
    "radiator",
  ];
  List<String> examples5 = [
    "TV board",
    "M2",
    "single check",
    "double",
    "radiator",
  ];
  List<String> values5 = [
    "11.50 / piece",
    "20.00 / piece",
    "50.00 / piece",
    "100.00 / piece",
    "60.00 / piece",
  ];

  int get currentType => _currentType;
  List<String> get itemNames => _itemNames;
  List<String> get examples => _examples;
  List<String> get values => _values;

  void setType(int newType) {
    _currentType = newType;

    switch (newType) {
      case 1:
        _itemNames = itemNames1;
        _examples = examples1;
        _values = values1;
        break;
      case 2:
        _itemNames = itemNames2;
        _examples = examples2;
        _values = values2;
        break;
      case 3:
        _itemNames = itemNames3;
        _examples = examples3;
        _values = values3;
        break;
      case 4:
        _itemNames = itemNames4;
        _examples = examples4;
        _values = values4;
        break;
      case 5:
        _itemNames = itemNames5;
        _examples = examples5;
        _values = values5;
        break;
      default:
        _itemNames = itemNames1;
        _examples = examples1;
        _values = values1;
    }

    notifyListeners();
  }
}
