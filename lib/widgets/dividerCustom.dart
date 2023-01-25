import 'package:flutter/material.dart';
import 'package:sepatu_shop/screens/theme/appTheme.dart';

Row DividerCustom(String titleDivider) {
  return Row(
    children: [
      const Expanded(
        child: Divider(color: Colors.white),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Text(
        titleDivider,
        style: AppTheme().themeData().textTheme.bodySmall!.copyWith(color: Colors.white, fontSize: 15),
      ),
      ),
      const Expanded(
        child: Divider(color: Colors.white,),
      ),
    ],
  );
}
