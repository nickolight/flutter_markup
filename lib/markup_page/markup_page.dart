import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markup/constants.dart';
import 'package:flutter_markup/markup_page/widgets/scrollable_markup.dart';
import 'package:flutter_markup/markup_page/widgets/static_markup.dart';
import 'package:flutter_markup/utils.dart';

class MarkupPage extends StatefulWidget {
  const MarkupPage({Key? key, required this.items}) : super(key: key);

  final List<String> items;

  @override
  State<MarkupPage> createState() => _MarkupPageState();
}

class _MarkupPageState extends State<MarkupPage> {
  late Image logoImage;
  late Size logoSize;

  void _incrementCounter() {
    setState(() {
      Utils.addNewItemToTheListOfStrings(widget.items);
    });
  }

  Future<Size> _calculateImageDimension(Image image) {
    Completer<Size> completer = Completer();
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }

  @override
  void initState() {
    logoImage = Image.asset('assets/logo.png');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Markup')),
      body: FutureBuilder<Size>(
        future: _calculateImageDimension(logoImage),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            logoSize = snapshot.data!;

            return LayoutBuilder(
              builder: (context, constraints) {
                Size tileSize = calculateTileSize(context);
                bool isScrollingRequired = checkIfScrollingIsRequired(
                    availableHeight: constraints.maxHeight,
                    tileHeight: tileSize.height,
                    tilesAmount: widget.items.length);
                if (isScrollingRequired) {
                  return ScrollableMarkup(
                    items: widget.items,
                    tileSize: tileSize,
                    image: logoImage,
                  );
                } else {
                  return StaticMarkup(
                    items: widget.items,
                    tileSize: tileSize,
                    image: logoImage,
                  );
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
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

    double imageWidthOnTheScreen =
        MediaQuery.of(context).size.width - Constants.logoMargin * 2;

    double ratio = logoSize.width / logoSize.height;

    double imageHeightOnTheScreen = imageWidthOnTheScreen / ratio;

    double requiredHeight = numberOfRows * tileHeight +
        (numberOfRows + 1) * Constants.margin +
        imageHeightOnTheScreen +
        Constants.logoMargin * 2;

    return availableHeight < requiredHeight;
  }
}
