import 'package:flutter/material.dart';
import 'package:sepatu_shop/misc/misc.dart';
import 'package:sepatu_shop/screens/theme/appTheme.dart';
import 'package:sepatu_shop/widgets/rowTextButton.dart';
import 'package:sepatu_shop/widgets/textFieldCustom.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFieldCustom(title: 'Email*'),
        SizedBox(
          height: 15,
        ),
        TextFieldCustom(title: 'Password*', hint: 'Min. 8 Characters'),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 50,
          ),
          child: RowTextButton(
            title: 'Remember me',
            buttonTitle: 'Forget Password?',
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: buttonCustomColor,
              boxShadow: const [
                buttonCustomShadow,
              ]),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Sign In',
              style: AppTheme().themeData().textTheme.bodyMedium,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: RowTextButton(
            title: 'No Account Yet?',
            buttonTitle: 'Create One',
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        )
      ],
    );
  }
}
