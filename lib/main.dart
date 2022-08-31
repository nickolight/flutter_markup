import 'package:flutter/material.dart';
import 'package:flutter_markup/markup.dart';
import 'package:flutter_markup/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MarkupPage(items: Utils.generateListOfString(5)),
    );
  }
}
