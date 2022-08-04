import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pricelist/providers/category_provider.dart';

class CategoryBtn extends StatefulWidget {
  const CategoryBtn(
      {Key? key, required this.categoryName, required this.typeId})
      : super(key: key);

  final String categoryName;
  final int typeId;

  @override
  State<CategoryBtn> createState() => _CategoryBtnState();
}

class _CategoryBtnState extends State<CategoryBtn> {
  @override
  Widget build(BuildContext context) {
    double categorySize =
        widget.typeId == context.watch<CategoryState>().currentType
            ? 55.0
            : 45.0;
    ;

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
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: colorActive,
              width: 1.5,
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: GestureDetector(
              onTap: () {
                context.read<CategoryState>().setType(widget.typeId);
              },
              child: AnimatedSize(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  width: categorySize,
                  height: categorySize,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/plastics.jpg'),
                      scale: 1.5,
                      fit: BoxFit.cover,
                      colorFilter: colored,
                    ),
                    shape: BoxShape.circle,
                  ),
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
