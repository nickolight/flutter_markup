import 'package:flutter/material.dart';

class MarkupPage extends StatelessWidget {
  const MarkupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
        ),
      ),
    );
  }
}