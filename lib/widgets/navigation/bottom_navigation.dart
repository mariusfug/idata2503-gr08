import 'package:flutter/material.dart';

import '../../main.dart';
import '../../services/auth.dart';
import 'package:idata2503_group08/pages/chat/chatPage.dart';
import 'package:idata2503_group08/pages/group/Group.dart';
import 'package:idata2503_group08/pages/main_pages/home_page.dart';


class BottomNavigation extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _childern = [
    Container(
      child: HomePage(onSignOut: () {  }, auth: Auth() ,),
    ),
    Container(
      child: MyApp(),
    ),
    Container(
      //child: UserPost(title: ' '),
    ),
    Container(
      child: Group(),
    ),
    Container(
      child: Chat(),
    )

  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //onTap: onTabTapped,

        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0x90B8B8B8),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("resources/icons/home_outline.png"),
              color: Color(0xFFB8B8B8),
              size: 30,
            ),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("resources/icons/discover_outline.png"),
              color: Color(0xFFB8B8B8),
              size: 30,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("resources/icons/plus_outline.png"),
              color: Color(0xFFB8B8B8),
              size: 45,
            ),
            label: 'New post',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("resources/icons/group_outline.png"),
              color: Color(0xFFB8B8B8),
              size: 30,
            ),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("resources/icons/chat_bubble_outline.png"),
              color: Color(0xFFB8B8B8),
              size: 30,
            ),
            label: 'Chats',
          ),
        ],
    );
  }
}



