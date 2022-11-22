import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:idata2503_group08/widgets/navigation/bottom_navigation.dart';
import 'package:idata2503_group08/widgets/navigation/top_navigation.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavigation(),
      body: Column(),
      bottomNavigationBar: const BottomNavBar(),


    );
  }
  
}