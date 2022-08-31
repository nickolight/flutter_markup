import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}
