import 'package:flutter/material.dart';
import 'package:sepatu_shop/misc/misc.dart';

AppBar AppbarCustom(String title, {List<Widget>? actionList, autoBack = false}) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        title,
        textAlign: TextAlign.end,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    ),
    backgroundColor: pitchBlack,
    automaticallyImplyLeading: autoBack,
    elevation: 0,
    actions: actionList,
  );
}
