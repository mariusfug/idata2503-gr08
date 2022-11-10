import 'package:flutter/material.dart';
import 'package:idata2503_group08/pages/add_post/add_new_post.dart';
import 'package:idata2503_group08/pages/main_pages/main_screen.dart';

import '../../services/auth.dart';
import 'package:idata2503_group08/pages/main_pages/home_page.dart';

class TopNavigation extends StatelessWidget with PreferredSizeWidget {
  const TopNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Forum app'),
      backgroundColor: const Color(0xFF1E1E1E),
      actions: [
        /// Notification bell
        RawMaterialButton(
          onPressed: () {
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (context) => MainScreen(auth: Auth()));
            Navigator.of(context).push(materialPageRoute);
          },
          elevation: 2.0,
          shape: const CircleBorder(),
          child: const ImageIcon(
            AssetImage("resources/icons/notification_outline.png"),
            color: Color(0xFFB8B8B8),
            size: 30,
          ),
        ),

        /// Spacing between
        const SizedBox(
          width: 10,
        ),

        /// Profile button
        RawMaterialButton(
          constraints: BoxConstraints.tight(const Size(35.0, 35.0)),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (context) => const AddNewPost());
            Navigator.of(context).push(materialPageRoute);
          },
          elevation: 2.0,
          fillColor: const Color(0xFFB8B8B8),
          shape: const CircleBorder(),
          child: const ImageIcon(
            AssetImage("resources/icons/user_outline.png"),
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override

  /// Required for AppBar
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
