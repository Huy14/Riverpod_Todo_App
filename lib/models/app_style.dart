import 'package:flutter/material.dart';

class AppStyle {
  static const label = TextStyle(fontSize: 20);

  static const title = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  static const dateTitle = TextStyle(
    fontSize: 18,
  );

  static const buttonStyle = ButtonStyle(
    padding: MaterialStatePropertyAll(
      EdgeInsets.symmetric(vertical: 16),
    ),
  );
}
