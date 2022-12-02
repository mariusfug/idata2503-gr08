import 'package:flutter/material.dart';

import '../../model/post.dart';
import '../model/group.dart';
import '../services/format_time.dart';

class GroupSelectionCard extends StatelessWidget {
  final Group group;
  bool isSelected;

  GroupSelectionCard(this.group, this.isSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: GestureDetector(
        child: Card(
          margin: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
          shape: RoundedRectangleBorder(
              side: isSelected
                  ? const BorderSide(color: Colors.white, width: 1.5)
                  : const BorderSide(color: Color(0xFF2D2D30)),
              borderRadius: BorderRadius.circular(15.0)),
          color: const Color(0xFF2D2D30),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.name,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
