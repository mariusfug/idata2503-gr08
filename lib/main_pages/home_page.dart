import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:idata2503_group08/navigation/bottom_navigation.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum app'),
        backgroundColor: const Color(0xFF1E1E1E),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
