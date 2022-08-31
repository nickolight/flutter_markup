import 'package:flutter/material.dart';
import 'package:flutter_markup/item_tile.dart';

class MarkupPage extends StatelessWidget {
  const MarkupPage({Key? key, required this.items}) : super(key: key);

  final List<String> items;
  static const double _padding = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Markup')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 2,
              mainAxisSpacing: _padding,
              crossAxisSpacing: _padding,
              padding: const EdgeInsets.all(_padding),
              children: List.generate(
                items.length,
                (index) => ItemTile(text: items[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
