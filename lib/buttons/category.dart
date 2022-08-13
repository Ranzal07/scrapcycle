import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:pricelist/firebase_crud.dart';
=======
import 'package:flutter/services.dart';
>>>>>>> e59fb8bcd3b78f7ccd9f82e44ebcd55bd1ac59ce
import 'package:provider/provider.dart';
import 'package:pricelist/providers/category_provider.dart';

class CategoryBtn extends StatefulWidget {
  const CategoryBtn({
    Key? key,
    required this.categoryName,
    required this.typeId,
    required this.image,
  }) : super(key: key);

  final String categoryName;
  final int typeId;
  final String image;

  @override
  State<CategoryBtn> createState() => _CategoryBtnState();
}

class _CategoryBtnState extends State<CategoryBtn> {
<<<<<<< HEAD
  final Stream<QuerySnapshot> collectionReference =
      FirebaseCrud.readPricelist();

  void printCollection() => print(collectionReference);
=======
  Future getList() async {
    String response = await rootBundle.loadString('assets/data/pricelist.json');
    print(response);
  }
>>>>>>> e59fb8bcd3b78f7ccd9f82e44ebcd55bd1ac59ce

  @override
  Widget build(BuildContext context) {
    double categorySize =
        widget.typeId == context.watch<CategoryState>().currentType
            ? 55.0
            : 45.0;

    ColorFilter? colored =
        widget.typeId != context.watch<CategoryState>().currentType
            ? const ColorFilter.mode(Colors.grey, BlendMode.screen)
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
            padding: const EdgeInsets.all(7.0),
            child: GestureDetector(
              onTap: () {
                context.read<CategoryState>().setType(widget.typeId);
<<<<<<< HEAD
                printCollection();
=======
                getList();
>>>>>>> e59fb8bcd3b78f7ccd9f82e44ebcd55bd1ac59ce
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                width: categorySize,
                height: categorySize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
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
