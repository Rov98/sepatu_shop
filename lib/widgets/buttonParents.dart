import 'package:flutter/material.dart';

Widget buttonParents(Color color, Widget child) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: color,
    ),
    child: child,
  );
}
