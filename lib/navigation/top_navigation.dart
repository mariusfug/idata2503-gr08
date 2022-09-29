import 'package:flutter/material.dart';

class TopNavigation extends StatelessWidget with PreferredSizeWidget {
  const TopNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Forum app'),
      backgroundColor: const Color(0xFF1E1E1E),
    );
  }

  @override
  // Required for AppBar
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}