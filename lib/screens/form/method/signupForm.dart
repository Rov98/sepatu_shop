import 'package:flutter/material.dart';

import '../../../misc/misc.dart';
import '../../../widgets/rowTextButton.dart';
import '../../../widgets/textFieldCustom.dart';
import '../../theme/appTheme.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextFieldCustom(title: 'First Name*'),),
            const SizedBox(width: 20,),
            Expanded(
              flex: 1,
            child: TextFieldCustom(title: 'Last Name*'),),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        TextFieldCustom(title: 'Email*'),
        const SizedBox(
          height: 15,
        ),
        TextFieldCustom(title: 'Password*', hint: 'Min. 8 Characters'),
        const SizedBox(
          height: 15,
        ),
        TextFieldCustom(title: 'Date Of Birth*', hint: 'Dd/Mm/Yyyy',),
        const SizedBox(
          height: 30,
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
              'Sign Up',
              style: AppTheme().themeData().textTheme.bodyMedium,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: RowTextButton(
            title: 'Already Have An Account?',
            buttonTitle: 'Sign In',
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        )
      ],
    );
  }
}
