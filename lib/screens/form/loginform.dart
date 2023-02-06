import 'package:flutter/material.dart';
import 'package:sepatu_shop/screens/form/method/signinForm.dart';
import 'package:sepatu_shop/screens/form/method/signinMethod.dart';
import 'package:sepatu_shop/screens/form/method/signupForm.dart';
import 'package:sepatu_shop/screens/form/method/signupMethod.dart';
import 'package:sepatu_shop/screens/theme/appTheme.dart';
import 'package:sepatu_shop/widgets/appbarbackOnly.dart';
import 'package:sepatu_shop/widgets/dividerCustom.dart';

enum LoginMode { SignIn, SignUp }

class LoginForm extends StatefulWidget {
  LoginForm({super.key, this.loginMode = LoginMode.SignIn});

  LoginMode loginMode;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarBackOnly(),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.only(left: 50),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.loginMode == LoginMode.SignIn
                            ? 'Welcome Back!'
                            : 'Create A Profil,',
                        style: AppTheme().themeData().textTheme.titleLarge,
                      ),
                      Text(
                        widget.loginMode == LoginMode.SignIn
                            ? 'Log Back into Your Account.'
                            : 'And Experience More.',
                        style: AppTheme().themeData().textTheme.titleMedium,
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding:
                          const EdgeInsets.only(top: 40, left: 30, bottom: 5),
                      child: Text(
                        widget.loginMode == LoginMode.SignIn
                            ? 'Sign in'
                            : 'Sign Up',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(30.0),
                            child: widget.loginMode == LoginMode.SignIn
                                ? const SignInMethod()
                                :const SignUpMethod(),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 30.0,
                            ),
                            child: DividerCustom(
                                widget.loginMode == LoginMode.SignIn
                                    ? 'Sign In with Email'
                                    : 'Sign Up With Email'),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            child: widget.loginMode == LoginMode.SignIn
                                ? const SigninForm()
                                : const SignUpForm(),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
