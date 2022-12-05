import 'package:flutter/material.dart';
import 'package:idata2503_group08/pages/user_page.dart';

class TopNavigation extends StatelessWidget with PreferredSizeWidget {
  TopNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Forum App"),
      backgroundColor: const Color(0xFF1E1E1E),
      actions: [
        /// Notification bell
        /// Spacing between
        const SizedBox(
          width: 10,
        ),

        /// Profile button
        RawMaterialButton(
          constraints: BoxConstraints.tight(const Size(35.0, 35.0)),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (context) => const UserPage());
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
