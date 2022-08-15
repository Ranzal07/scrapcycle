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
        CategoryBtn(
            categoryName: 'Plastic',
            typeId: 1,
            imageBtn:
                'https://images.pexels.com/photos/2547565/pexels-photo-2547565.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        CategoryBtn(
          categoryName: 'Glass',
          typeId: 2,
          imageBtn:
              'https://images.pexels.com/photos/4042772/pexels-photo-4042772.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ),
        CategoryBtn(
          categoryName: 'Metal',
          typeId: 3,
          imageBtn:
              'https://images.pexels.com/photos/4593026/pexels-photo-4593026.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ),
        CategoryBtn(
            categoryName: 'Carton',
            typeId: 4,
            imageBtn:
                'https://images.pexels.com/photos/1555199/pexels-photo-1555199.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      ],
    );
  }
}
