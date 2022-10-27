import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../navigation/bottom_navigation.dart';
import '../navigation/top_navigation.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.auth, required this.onSignOut});

  final AuthBase auth;
  final VoidCallback onSignOut;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigation(),
      bottomNavigationBar: BottomNavigation(),
      body: ElevatedButton(onPressed: _signOut, child: const Text("Logout")),
    );
  }
}
