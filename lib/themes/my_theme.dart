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
    textTheme: TextTheme(
        displaySmall: TextStyle(
            color: Colors.black,
            fontSize: 24,
            overflow: TextOverflow.ellipsis
        )
    ),
    primaryTextTheme: TextTheme(
        labelLarge: TextStyle(
            fontSize: 16
        )
    )
);
