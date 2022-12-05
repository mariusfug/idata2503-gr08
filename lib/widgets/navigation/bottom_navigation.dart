import 'package:flutter/material.dart';
import 'package:idata2503_group08/pages/add_post/add_new_post.dart';
import 'package:idata2503_group08/pages/chat_page.dart';
import 'package:idata2503_group08/pages/discover_page.dart';
import 'package:idata2503_group08/pages/groups_page.dart';
import 'package:idata2503_group08/pages/main_pages/feed.dart';
import 'package:idata2503_group08/services/auth.dart';

import '../../services/firestore/api_paths.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super (key: key);


  @override
  State<BottomNavBar> createState() => _BottomNavBar();


}

class _BottomNavBar extends State<BottomNavBar> {

  int _selectedIndex = 0;

  List<Widget> pages = [
    Feed(groupId: ApiPaths.group("general")),
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
    return BottomAppBar(
      color: const Color(0xFF1E1E1E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            color: const Color(0x90B8B8B8),
              onPressed: () {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (context) => Feed(groupId: ApiPaths.group("general")));
                Navigator.of(context).push(materialPageRoute);
              },
              tooltip: "HomePage",
              icon: const ImageIcon(
                AssetImage("resources/icons/home_outline.png"),
                size: 30,
              ),
          ),

          IconButton(
            color: const Color(0x90B8B8B8),
              onPressed: () {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (context) => DiscoverPage());
                Navigator.of(context).push(materialPageRoute);
              },
              tooltip: "Discover",
              icon: const ImageIcon(
                AssetImage("resources/icons/discover_outline.png"),
                size: 30,
              ),
          ),

          IconButton(
            color: const Color(0x90B8B8B8),
              onPressed: () {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (context) => const AddNewPost());
                Navigator.of(context).push(materialPageRoute);
              },
              tooltip: "New Post",
              icon: const ImageIcon(
                AssetImage("resources/icons/plus_outline.png"),
                size: 45,
              ),
          ),

          IconButton(
            color: const Color(0x90B8B8B8),
              onPressed: () {
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (context) => GroupsPage());
              Navigator.of(context).push(materialPageRoute);
              },
            tooltip: "Groups",
              icon: const ImageIcon(
                AssetImage("resources/icons/group_outline.png"),
                size: 30,
              ),
          ),

          IconButton(
            color: const Color(0x90B8B8B8),
              onPressed: () {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (context) => ChatPage());
                Navigator.of(context).push(materialPageRoute);
              },
            tooltip: "Chats",
              icon: const ImageIcon(
                AssetImage("resources/icons/chat_bubble_outline.png"),
                size: 30,
              ),
          ),
        ],
      ),
    );
  }

}





  
  

