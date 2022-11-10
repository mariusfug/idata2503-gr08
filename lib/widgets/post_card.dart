import 'package:flutter/material.dart';

import '../../model/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: const Color(0xFF2D2D30),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const Divider(height: 15, color: Colors.white, thickness: 1),
              (post.content == null)
                  ? Container()
                  : Text(post.content!,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.white)),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      print("object");
                    },
                    icon: const ImageIcon(
                      AssetImage("resources/icons/upvote.png"),
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  Text(
                    "${post.upVote}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      print("object");
                    },
                    icon: const ImageIcon(
                      AssetImage("resources/icons/downvote.png"),
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  Text(
                    "${post.downVote}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    post.boardTag,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      print("object");
                    },
                    icon: const ImageIcon(
                      AssetImage("resources/icons/chat_bubble_outline.png"),
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
