import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sepatu_shop/misc/misc.dart';
import 'package:sepatu_shop/widgets/appbarCustom.dart';

class UserInfoPage extends StatelessWidget {
  UserInfoPage({super.key, required this.user});
  final User user;

  Future<void> _signOut(context) async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom('${user.displayName}\'s profile', autoBack: true),
      backgroundColor: pitchBlack,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipOval(
                child: Material(
                  color: Colors.grey,
                  child: user.photoURL != null
                      ? Image.network(
                          user.photoURL!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.person_rounded),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Welcome ${user.displayName}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              ElevatedButton(onPressed:()=> _signOut(context), child: Text('Sign out'))
            ],
          ),
        ),
      )),
    );
  }
}
