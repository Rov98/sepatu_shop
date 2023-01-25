import 'package:flutter/material.dart';

import '../../../widgets/loginButton.dart';

class SignUpMethod extends StatelessWidget {
  const SignUpMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {},
          child: LoginButton(
            title: 'Sign up With Google',
            color: Colors.white,
            icon: const Icon(Icons.g_mobiledata_rounded),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: LoginButton(
            title: 'Sign up With Facebook',
            color: Colors.white,
            icon: const Icon(Icons.facebook_rounded),
          ),
        ),
      ],
    );
  }
}
