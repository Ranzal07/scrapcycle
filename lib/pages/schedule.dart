import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.navigate_next),
        label: const Text('hello'),
      ),
    );
  }
}
