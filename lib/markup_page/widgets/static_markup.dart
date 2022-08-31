import 'package:flutter/material.dart';
import 'package:flutter_markup/constants.dart';
import 'package:flutter_markup/item_tile.dart';
import 'package:flutter_markup/markup_page/widgets/logo.dart';

class StaticMarkup extends StatelessWidget {
  const StaticMarkup({
    Key? key,
    required this.items,
    required this.tileSize,
  }) : super(key: key);

  final List<String> items;
  final Size tileSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Logo(),
        ),
        Expanded(
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: Constants.numberOfColumns,
            childAspectRatio: Constants.aspectRatio,
            mainAxisSpacing: Constants.margin,
            crossAxisSpacing: Constants.margin,
            padding: const EdgeInsets.all(Constants.margin),
            children: List.generate(
              items.length,
              (index) => ItemTile(text: items[index], size: tileSize),
            ),
          ),
        ),
      ],
    );
  }
}
