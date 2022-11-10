import 'package:flutter/material.dart';
import 'package:idata2503_group08/pages/add_post/add_new_post.dart';
import 'package:idata2503_group08/pages/chat_page.dart';
import 'package:idata2503_group08/pages/discover_page.dart';
import 'package:idata2503_group08/pages/groups_page.dart';
import 'package:idata2503_group08/pages/main_pages/home_page.dart';
import 'package:idata2503_group08/widgets/navigation/top_navigation.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.auth})
      : super(key: key);

  final AuthBase auth;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    DiscoverPage(),
    const AddNewPost(),
    GroupsPage(),
    ChatPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: Scaffold(
        appBar: const TopNavigation(),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF1E1E1E),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0x90B8B8B8),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("resources/icons/home_outline.png"),
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("resources/icons/discover_outline.png"),
                size: 30,
              ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("resources/icons/plus_outline.png"),
                size: 45,
              ),
              label: 'New post',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("resources/icons/group_outline.png"),
                size: 30,
              ),
              label: 'Groups',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("resources/icons/chat_bubble_outline.png"),
                size: 30,
              ),
              label: 'Chats',
            ),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
