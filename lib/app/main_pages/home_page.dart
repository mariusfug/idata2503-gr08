import 'package:flutter/material.dart';
import '../navigation/bottom_navigation.dart';
import '../navigation/top_navigation.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopNavigation(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
