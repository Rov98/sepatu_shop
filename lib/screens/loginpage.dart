import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sepatu_shop/screens/homepage.dart';
import 'package:sepatu_shop/widgets/landingtext.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<UserCredential> singinwithGoogle() async {
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

  Future<UserCredential> signInwithFacebook() async {
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

  Widget _buttonParents(Color color, Widget child) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: child,
    );
  }

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
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buttonParents(
              Color.fromARGB(255, 123, 97, 255),
              TextButton.icon(
                icon: const Icon(
                  Icons.facebook_rounded,
                  color: Colors.white,
                ),
                onPressed: signInwithFacebook,
                label: const Text('Continue with Facebook',
                    overflow: TextOverflow.clip,
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            _buttonParents(
              Colors.white,
              TextButton.icon(
                icon: const Icon(Icons.g_mobiledata_rounded),
                onPressed: singinwithGoogle,
                label: const Text('Continue with Google',
                    overflow: TextOverflow.clip,
                    style: TextStyle(color: Colors.black, fontSize: 20)),
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
