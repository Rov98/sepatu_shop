
import 'package:flutter/material.dart';
import 'package:sepatu_shop/widgets/landingtext.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: LandingText(),
      ),
    );
  }
}