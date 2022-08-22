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
          categoryName: 'Glass',
          typeId: 1,
          imageBtn:
              'https://images.pexels.com/photos/4042772/pexels-photo-4042772.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ),
        CategoryBtn(
            categoryName: 'Plastic',
            typeId: 2,
            imageBtn:
                'https://images.pexels.com/photos/2547565/pexels-photo-2547565.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        CategoryBtn(
          categoryName: 'Metal',
          typeId: 3,
          imageBtn:
              'https://images.pexels.com/photos/4593026/pexels-photo-4593026.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ),
        CategoryBtn(
            categoryName: 'Battery',
            typeId: 4,
            imageBtn:
                'https://s.alicdn.com/@sc04/kf/U01beb17b43164ab49f3f347fa77a4e04i.jpg_300x300.jpg'),
        CategoryBtn(
            categoryName: 'E-Waste',
            typeId: 5,
            imageBtn:
                'https://5.imimg.com/data5/LK/QW/GLADMIN-6387176/printed-circuit-boards-scrap-500x500.png'),
      ],
    );
  }
}
