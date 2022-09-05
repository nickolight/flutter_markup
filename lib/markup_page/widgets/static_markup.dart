import 'package:flutter/material.dart';
import 'package:flutter_markup/constants.dart';
import 'package:flutter_markup/markup_page/widgets/item_tile.dart';
import 'package:flutter_markup/markup_page/widgets/logo.dart';

class StaticMarkup extends StatelessWidget {
  const StaticMarkup({
    Key? key,
    required this.items,
    required this.tileSize,
    required this.image,
  }) : super(key: key);

  final List<String> items;
  final Size tileSize;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Logo(image: image),
        ),
        if (items.isNotEmpty)
          GridView.count(
            shrinkWrap: true,
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
      ],
    );
  }
}
