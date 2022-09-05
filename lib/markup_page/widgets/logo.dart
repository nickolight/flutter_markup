import 'package:flutter/material.dart';
import 'package:flutter_markup/constants.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, required this.image}) : super(key: key);

  final Image image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.logoMargin),
      child: image,
    );
  }
}
