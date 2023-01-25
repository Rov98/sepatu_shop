import 'package:flutter/material.dart';

import '../screens/theme/appTheme.dart';

class LoginButton extends StatelessWidget {
  LoginButton(
      {super.key,
      required this.title,
      required this.color,
      required this.icon});
  String title;
  Color color;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 0),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 50,
              width: 50,
              child: FittedBox(
                child: icon,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 200,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: AppTheme()
                    .themeData()
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 20, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
