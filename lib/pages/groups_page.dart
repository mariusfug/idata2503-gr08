import 'package:flutter/material.dart';
import 'package:idata2503_group08/widgets/navigation/bottom_navigation.dart';
import 'package:idata2503_group08/widgets/navigation/top_navigation.dart';

class GroupsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
      appBar: TopNavigation(),
      bottomNavigationBar: const BottomNavBar(),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20,),
            RawMaterialButton(onPressed: () { },
                elevation: 2.0,
                fillColor: const Color(0xFFFFFFFF),
                shape: const CircleBorder(),
                child: const ImageIcon(
                  AssetImage("resources/icons/group_outline.png"),
                  size: 150,
                )),
            const SizedBox(height: 20,),
            RawMaterialButton(onPressed: () { },
                elevation: 2.0,
                fillColor: const Color(0xFFFFFFFF),
                shape: const CircleBorder(),
                child: const ImageIcon(
                  AssetImage("resources/icons/group_outline.png"),
                  size: 150,
                )),
            const SizedBox(height: 20,),
            RawMaterialButton(onPressed: () { },
                elevation: 2.0,
                fillColor: const Color(0xFFFFFFFF),
                shape: const CircleBorder(),
                child: const ImageIcon(
                  AssetImage("resources/icons/plus_outline.png"),
                  size: 150,
                ))
          ],
        ),
      )

            );






  }

}