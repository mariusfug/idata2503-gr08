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
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 30),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, size: 45),
            label: 'New post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, size: 30),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, size: 30),
            label: 'Chats',
          ),
        ],
    );
  }
}
