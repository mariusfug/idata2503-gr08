import 'package:flutter/material.dart';

class TopNavigation extends StatelessWidget with PreferredSizeWidget {
  const TopNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Forum app'),
      backgroundColor: const Color(0xFF1E1E1E),
      actions: [
        RawMaterialButton(
          constraints: BoxConstraints.tight(const Size(35.0, 35.0)),
          onPressed: null,
          elevation: 2.0,
          fillColor: Colors.white,
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
  // Required for AppBar
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
