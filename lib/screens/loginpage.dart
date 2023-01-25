import 'package:flutter/material.dart';
import 'package:sepatu_shop/screens/form/loginform.dart';
import 'package:sepatu_shop/screens/homepage.dart';
import 'package:sepatu_shop/screens/theme/appTheme.dart';
import 'package:sepatu_shop/widgets/landingtext.dart';

import '../widgets/buttonParents.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Center(
            child: LandingText(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buttonParents(
              Colors.blue.shade300,
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginForm(
                        loginMode: LoginMode.SignUp,
                      ),
                    ),
                  );
                },
                child: Text('Sign up',
                    style: AppTheme().themeData().textTheme.bodyMedium),
              ),
            ),
            buttonParents(
              Colors.white,
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          LoginForm(loginMode: LoginMode.SignIn),
                    ),
                  );
                },
                child: Text(
                  'Sign in',
                  style: AppTheme()
                      .themeData()
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomePage(),
            )),
            child: const Text(
              'Skip',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
