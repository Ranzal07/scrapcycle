import 'package:flutter/material.dart';
import 'package:pricelist/buttons/category.dart';

class CategoryBar extends StatefulWidget {
  CategoryBar({Key? key}) : super(key: key);

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        CategoryBtn(categoryName: 'Plastic', typeId: 1),
        CategoryBtn(categoryName: 'Glass', typeId: 2),
        CategoryBtn(categoryName: 'Metal', typeId: 3),
        CategoryBtn(categoryName: 'Carton', typeId: 4),
        CategoryBtn(categoryName: 'E-Waste', typeId: 5),
      ],
    );
  }
}
