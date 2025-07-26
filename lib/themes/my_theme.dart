import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  primaryColor: Colors.pink,
  colorScheme:
      ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
      ).copyWith(
        secondary: Colors.amber,
        surface: Color.fromRGBO(210, 220, 230, 1.0),
      ),
);
