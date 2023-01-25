import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sepatu_shop/widgets/loginButton.dart';

class SignInMethod extends StatelessWidget {
  const SignInMethod({super.key});

    Future<UserCredential> _singinwithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> _signInwithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final facebookCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      return await FirebaseAuth.instance
          .signInWithCredential(facebookCredential);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: (){},
          child: LoginButton(
            title: 'Sign in With Google',
            color: Colors.white,
            icon: const Icon(Icons.g_mobiledata_rounded),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: (){},
          child: LoginButton(
            title: 'Sign in With Facebook',
            color: Colors.white,
            icon: const Icon(Icons.facebook_rounded),
          ),
        ),
      ],
    );
  }
}
