import 'dart:ui';

import 'comment.dart';

class Post {
  String title;
  final String? content;
  int upVote = 0;
  int downVote = 0;
  Image? image;
  final String boardTag;
  final String? groupTag;

  Post(
      {required this.title,
      required this.upVote,
      required this.downVote,
      required this.boardTag,
      this.groupTag,
      this.image,
      this.content});

  static Post fromMap(Map<String, dynamic> data) {
    assert(data.containsKey("title"), "Missing title property");
    assert(data.containsKey("content"), "Missing content property");
    assert(data.containsKey("upvote"), "Missing upvote property");
    assert(data.containsKey("downvote"), "Missing downvote property");
    assert(data.containsKey("boardTag"), "Missing board tag property");
    assert(data.containsKey("groupTag"), "Missing group tag property");
    assert(data.containsKey("image"), "Missing image property");

    return Post(
        title: data["title"],
        content: data["content"],
        upVote: data["upvote"],
        downVote: data["downvote"],
        boardTag: data["boardTag"],
        groupTag: data["groupTag"],
        image: data["image"]);
  }
}
