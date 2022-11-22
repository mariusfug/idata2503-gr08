import 'package:flutter/material.dart';
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
      appBar: const TopNavigation(),
      body: Container(
        color: const Color(0x1E1E1E1E),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                const Text("UserProfile"),
                IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: () {
                    print("button is pressed");
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    print("logout button pressed");
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
