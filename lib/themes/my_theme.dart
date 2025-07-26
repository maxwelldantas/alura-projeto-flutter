import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  primaryColor: Colors.red,
  colorScheme:
      ColorScheme.fromSwatch(
        // primarySwatch: Colors.blue,
        // accentColor: Colors.amber,
      ).copyWith(
        surface: Color.fromRGBO(210, 220, 230, 1.0),
      ),
);
