import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.black;
  static const Color primaryClear = Colors.white;
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    //Tema para el AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      foregroundColor: primaryClear,
      centerTitle: true,
    ),

    //Tema para el FAB
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: primaryClear,
    ),
  );
}
