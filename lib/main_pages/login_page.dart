import "package:flutter/material.dart";
import 'package:idata2503_group08/navigation/bottom_navigation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:SignIn(),
      bottomNavigationBar: BottomNavigation(),


    );
  }
}


class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1E1E1E),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
            const Text("Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),),
            ElevatedButton(onPressed: (){print("working");},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0x99FFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
              ),


              child:
              const Text("Sign in with Google",
                style: TextStyle(color: Colors.white),),
              
            ),
            ElevatedButton(onPressed: (){print("working");},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4267B2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
            )
              ),


              child: const Text("Sign in with Facebook",
                style: TextStyle(color: Colors.white),),
            ),
            ElevatedButton(onPressed: (){print("working");},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F7942),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),


              child: const Text("Sign in with Email",
                style: TextStyle(color: Colors.white),),


            ),





          ]
      ),

    );}
}

