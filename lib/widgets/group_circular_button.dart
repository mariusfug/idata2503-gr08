import 'package:flutter/material.dart';
import 'package:idata2503_group08/services/firestore/api_paths.dart';

import '../../model/post.dart';
import '../model/group.dart';
import '../pages/main_pages/feed.dart';
import '../services/format_time.dart';

class GroupCircularButton extends StatelessWidget {
  final Group group;

  const GroupCircularButton(this.group, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RawMaterialButton(
          onPressed: () {MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (context) => Feed(groupId: ApiPaths.group(group.id),));
          Navigator.of(context).push(materialPageRoute);},
          elevation: 2.0,
          fillColor: const Color(0xFFB8B8B8),
          shape: const CircleBorder(),
          child: const ImageIcon(
            AssetImage("resources/icons/group_outline.png"),
            size: 125,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          group.name,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
