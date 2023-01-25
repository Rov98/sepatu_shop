import 'package:flutter/material.dart';
import 'package:sepatu_shop/misc/misc.dart';
import 'package:sepatu_shop/screens/theme/appTheme.dart';

Widget Banner_Carousel(String title) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    padding: const EdgeInsets.all(30.0),
    alignment: Alignment.centerRight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: buttonCustomColor,
    ),
    child: Text(title, style: AppTheme().themeData().textTheme.bodyMedium,),
  );
}
