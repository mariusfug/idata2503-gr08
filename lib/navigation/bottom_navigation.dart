import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
