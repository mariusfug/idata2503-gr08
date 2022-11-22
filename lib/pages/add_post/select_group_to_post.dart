import 'package:flutter/material.dart';
import 'package:idata2503_group08/widgets/navigation/bottom_navigation.dart';
import 'package:provider/provider.dart';
import '../../model/post.dart';
import '../../services/repository.dart';
import '../../widgets/navigation/top_navigation.dart';

class SelectGroupToPost extends StatefulWidget {
  const SelectGroupToPost({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  State<SelectGroupToPost> createState() => _SelectGroupToPostState();
}

class _SelectGroupToPostState extends State<SelectGroupToPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavigation(),
      backgroundColor: const Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: const Color(0xFF2D2D30),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: Stack(
                children: [
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                              child: Text(
                            "Post to",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          )),
                          Align(
                            alignment: Alignment.centerRight,
                            child: _buildAddPostButton(context),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 30,
                        child: TextField(
                          cursorColor: Colors.black,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  color: Colors.white38, width: 1.0),
                            ),
                            hintText: "Search...",
                            hintStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            contentPadding:
                                const EdgeInsets.fromLTRB(12, 5, 12, 5),
                            filled: true,
                            fillColor: const Color(0xFFB8B8B8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildAddPostButton(context) {
    return ElevatedButton(
      onPressed: () => _addPost(context),
      key: const Key("post_next_button"),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xCC007ACC),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        disabledBackgroundColor: Colors.white24,
        disabledForegroundColor: Colors.white,
      ),
      child: const Text(
        "Add post",
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  /// Add new post, should be called from 'Add post' button only
  void _addPost(BuildContext context) async {
    try {
      Repository repository = Provider.of<Repository>(context, listen: false);
      repository.addPostWithAutogeneratedId(
          'groups/general/posts', widget.post);
    } catch (e) {
      print(e.toString());
    }
  }
}
