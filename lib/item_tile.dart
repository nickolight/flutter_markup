import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.text,
    required this.size,
  }) : super(key: key);

  final String text;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
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
