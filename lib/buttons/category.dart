import 'package:flutter/material.dart';

class CategoryBtn extends StatefulWidget {
  const CategoryBtn({Key? key, required this.categoryName}) : super(key: key);

  final String categoryName;

  @override
  State<CategoryBtn> createState() => _CategoryBtnState();
}

class _CategoryBtnState extends State<CategoryBtn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffE0E0E0),
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/plastics.jpg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.grey, BlendMode.saturation),
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            widget.categoryName,
            style: const TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }
}
