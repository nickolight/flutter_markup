import 'package:flutter/material.dart';
import 'package:flutter_markup/constants.dart';
import 'package:flutter_markup/markup_page/widgets/scrollable_markup.dart';
import 'package:flutter_markup/markup_page/widgets/static_markup.dart';

class MarkupPage extends StatelessWidget {
  const MarkupPage({Key? key, required this.items}) : super(key: key);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Markup')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          Size tileSize = calculateTileSize(context);
          bool isScrollingRequired = checkIfScrollingIsRequired(
              availableHeight: constraints.maxHeight / 2,
              tileHeight: tileSize.height,
              tilesAmount: items.length);
          if (isScrollingRequired) {
            return ScrollableMarkup(items: items, tileSize: tileSize);
          } else {
            return StaticMarkup(items: items, tileSize: tileSize);
          }
        },
      ),
    );
  }

  Size calculateTileSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tileWidth =
        (screenWidth - Constants.margin * (Constants.numberOfColumns + 1)) /
            Constants.numberOfColumns;
    double tileHeight = tileWidth / Constants.aspectRatio;
    return Size(tileWidth, tileHeight);
  }

  bool checkIfScrollingIsRequired({
    required double availableHeight,
    required double tileHeight,
    required int tilesAmount,
  }) {
    int numberOfRows = (tilesAmount / Constants.numberOfColumns).ceil();

    return availableHeight <
        (numberOfRows * tileHeight + (numberOfRows + 1) * Constants.margin);
  }
}
