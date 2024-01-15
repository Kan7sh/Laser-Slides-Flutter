import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Color(0xff121212),
        primary: Colors.white,
        tertiary: const Color.fromRGBO(33, 33, 33, 1),
        tertiaryContainer: Colors.grey[700],
        secondary: Colors.white70));
