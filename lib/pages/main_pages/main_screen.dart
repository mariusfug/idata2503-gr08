import 'package:flutter/material.dart';
import 'package:idata2503_group08/pages/add_post/add_new_post.dart';
import 'package:idata2503_group08/pages/chat_page.dart';
import 'package:idata2503_group08/pages/discover_page.dart';
import 'package:idata2503_group08/pages/groups_page.dart';
import 'package:idata2503_group08/pages/main_pages/home_page.dart';
import 'package:idata2503_group08/widgets/navigation/top_navigation.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';
import '../../widgets/navigation/bottom_navigation.dart';

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
        appBar: TopNavigation(),
        body: pages[_selectedIndex],
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
