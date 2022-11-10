import 'package:flutter/material.dart';

import '../../widgets/navigation/bottom_navigation.dart';
import '../../widgets/navigation/top_navigation.dart';

class SelectGroupToPost extends StatefulWidget {
  const SelectGroupToPost({Key? key}) : super(key: key);

  @override
  State<SelectGroupToPost> createState() => _SelectGroupToPostState();
}

class _SelectGroupToPostState extends State<SelectGroupToPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigation(),
      bottomNavigationBar: BottomNavigation(),
      backgroundColor: const Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: const Color(0x1E1E1E1E),
          ),
        ),
      ),
    );
  }

  /*/// Add new post, should be called from 'Add post' button only
  void _addPost(BuildContext context) async {
    try {
      if (!_titleValid()) {
        _enableValidation();
      } else {
        Repository repository = Provider.of<Repository>(context, listen: false);
        repository.addPostWithAutogeneratedId(
            'groups/general/posts',
            Post(
                title: _title,
                content: _content,
                upVote: 0,
                downVote: 0,
                boardTag: "all"));
      }
    } catch (e) {
      print(e.toString());
    }
  }*/
}
