import 'package:flutter/material.dart';

class CategoryState with ChangeNotifier {
  int _currentType = 1;
  List<String> _itemNames = ["plastic cups", "cartons", "PET bottles"];
  List<String> _values = ["3.00 / kg", "12.00 / kg", "10.00 / kg"];
  List<String> _examples = [
    "plastic cups, hsdjklfjsd, sjdfgkf, sadlifhailsfd",
    "cartons, sjdkfgksdf, sadfghksdf, sajkfdgsdf",
    "PET bottles, jsadgff, sjdfksadf, askjdguasgd"
  ];

// plastics
  List<String> itemNames1 = ["plastic cups", "cartons", "PET bottles"];
  List<String> examples1 = [
    "plastic cups, hsdjklfjsd, sjdfgkf, sadlifhailsfd",
    "cartons, sjdkfgksdf, sadfghksdf, sajkfdgsdf",
    "PET bottles, jsadgff, sjdfksadf, askjdguasgd"
  ];
  List<String> values1 = ["3.00 / kg", "12.00 / kg", "10.00 / kg"];

// glass
  List<String> itemNames2 = [
    "Emperador long neck",
    "Emperador lapad",
    "Ginebra gin",
    "Ketchup bottle",
    "Softdrinks bottle",
    "Glass cullets (bubog)"
  ];
  List<String> examples2 = [
    "Liquor bottle",
    "Liquor bottle",
    "Liquor bottle",
    "UFC glass bottle",
    "Coke, Pepsi, Sprite, etc.",
    "Broken glass bottles, colorless"
  ];
  List<String> values2 = [
    "1.50 / kg",
    "0.75 / kg",
    "0.65 / kg",
    "0.25 / kg",
    "2.00 / kg",
    "2.00 / kg",
  ];

// metal
  List<String> itemNames3 = [
    "Aluminum cans",
    "Copper wire (red color)",
    "Copper wire (reddish yellow color)",
    "Copper wire (yellow in thin strands)",
    "Iron alloys (bakal)",
    "Stainless steel",
    "GI sheets",
    "Tin can (lata)"
  ];
  List<String> examples3 = [
    "Softdrink cans",
    "Heavy duty wires used in aircons",
    "Ordinary wire used in extension cords",
    "Wire used in Christmas lights",
    "Steel tubes used for plumbing",
    "Pots & pans used for cooking",
    "Roofing sheets",
    "Sardine can, corned beef can, etc."
  ];
  List<String> values3 = [
    "50 / kg",
    "300 / kg",
    "250 / kg",
    "150 / kg",
    "9.00 / kg",
    "60.00 / kg",
    "7.00 / kg",
    "3.00 / kg"
  ];

// carton
  List<String> itemNames4 = ["Corrugated brown"];
  List<String> examples4 = ["Appliance boxes, packaging boxes"];
  List<String> values4 = ["2.50 / kg"];

// e-waste
  List<String> itemNames5 = ["Corrugated brown"];
  List<String> examples5 = ["Appliance boxes, packaging boxes"];
  List<String> values5 = ["2.50 / kg"];

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
