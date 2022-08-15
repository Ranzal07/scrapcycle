import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pricelist/firebase_crud.dart';
import 'package:provider/provider.dart';
import 'package:pricelist/providers/category_provider.dart';

class CategoryBtn extends StatefulWidget {
  const CategoryBtn(
      {Key? key,
      required this.categoryName,
      required this.typeId,
      required this.imageBtn})
      : super(key: key);

  final String categoryName;
  final String imageBtn;
  final int typeId;

  @override
  State<CategoryBtn> createState() => _CategoryBtnState();
}

class _CategoryBtnState extends State<CategoryBtn> {
  @override
  Widget build(BuildContext context) {
    double categorySize =
        widget.typeId == context.watch<CategoryState>().currentType
            ? 65.0
            : 53.0;

    ColorFilter? colored =
        widget.typeId != context.watch<CategoryState>().currentType
            ? const ColorFilter.mode(Colors.grey, BlendMode.saturation)
            : null;

    Color colorActive =
        widget.typeId != context.watch<CategoryState>().currentType
            ? const Color.fromARGB(255, 194, 194, 194)
            : const Color(0xff219653);

    return Column(
      children: [
        Container(
          height: 85,
          decoration: BoxDecoration(
            border: Border.all(
              color: colorActive,
              width: 1.5,
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: GestureDetector(
              onTap: () {
                context.read<CategoryState>().setType(widget.typeId);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                width: categorySize,
                height: categorySize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageBtn),
                    fit: BoxFit.cover,
                    colorFilter: colored,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            widget.categoryName,
            style: TextStyle(
              color: colorActive,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
