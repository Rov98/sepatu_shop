import 'package:flutter/material.dart';
import 'package:sepatu_shop/misc/misc.dart';

import '../screens/theme/appTheme.dart';

class RowTextButton extends StatelessWidget {
  RowTextButton({super.key, required this.title, required this.buttonTitle, required this.mainAxisAlignment});
  String title, buttonTitle;
  MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          title,
          style: AppTheme()
              .themeData()
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              buttonTitle,
              style: AppTheme()
                  .themeData()
                  .textTheme
                  .bodySmall!
                  .copyWith(color: buttonCustomColor, fontSize: 15, fontWeight: FontWeight.w400),
            )),
      ],
    );
  }
}
