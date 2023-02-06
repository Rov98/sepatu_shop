import 'package:flutter/material.dart';

ThemeData AppBarDelegateTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      toolbarTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 15),
    ),
  );
}
