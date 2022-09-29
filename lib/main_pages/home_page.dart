import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:idata2503_group08/navigation/bottom_navigation.dart';
import 'package:idata2503_group08/navigation/top_navigation.dart';


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
