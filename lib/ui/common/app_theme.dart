import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );
  }
}
