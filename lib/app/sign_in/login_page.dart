import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

import '../../services/auth.dart';


class SignIn extends StatelessWidget {
  const SignIn({super.key, required this.onSignIn, required this.auth});
  final AuthBase auth;
  final void Function(User?) onSignIn;

  Future<void> _signInAnonymously() async {
    try {
      final user = await auth.signInAnonymously();
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final user = await auth.signInWithGoogle();
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color(0xFF1E1E1E),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _signInWithGoogle();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0x99FFFFFF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text(
                "Sign in with Google",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("working");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4267B2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                "Sign in with Facebook",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("working");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F7942),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                "Sign in with Email",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("working");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFC6A03),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                "Sign in with mobile number",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _signInAnonymously();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                "Continue without signing in",
                style: TextStyle(color: Colors.black),
              ),
            ),

          ],
        ),

      )

    );
  }
}
