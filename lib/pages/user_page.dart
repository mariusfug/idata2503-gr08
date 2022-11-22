import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:idata2503_group08/services/auth.dart';
import 'package:idata2503_group08/widgets/navigation/bottom_navigation.dart';
import 'package:idata2503_group08/widgets/navigation/top_navigation.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: TopNavigation(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: const Color(0xFFFFFFFF),
                shape: const CircleBorder(),
                child: const ImageIcon(
                  AssetImage("resources/icons/user_outline.png"),
                  size: 200,
                ),
              ),

              const SizedBox(height: 16),

              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  fillColor: Color(0xffB8B8B8),
                  labelText: "Write BIO here",

                ),
              ),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () {},
                child: const Text(
                    "Settings",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 24,
                  ),
                ),
              ),

              const SizedBox(height: 16.0),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "Terms of Service",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 24,
                  ),
                ),
              ),

              const SizedBox(height: 16.0),

              TextButton(
                  onPressed: () => {
                    _signOut(context),
                  },
                  child: const Text(
                    "Sign out",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 24
                    ),
                  ),
              ),


            ],
          ),
        ),

      ),
      bottomNavigationBar: const BottomNavBar(),
    );


  }
  Future<void> _signOut(BuildContext context) async {
    try {
    final auth = Provider.of<AuthBase>(context, listen: false);
    await auth.signOut();
    } catch (e) {
    print(e.toString());
    }
  }
}
