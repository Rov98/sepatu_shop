import 'package:flutter/material.dart';
import 'package:sepatu_shop/misc/misc.dart';
import 'package:sepatu_shop/screens/loginpage.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: pitchBlack,
      body: SafeArea(
        child: LoginPage(),
      ),
    );
  }
}
