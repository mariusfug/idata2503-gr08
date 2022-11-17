import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String title;
  final String? content;
  int? upVote;
  int? downVote;
  Image? image;
  final String boardTag;
  final String? groupTag;
  DateTime createdAt;

  Post(
      {required this.title,
      required this.boardTag,
      this.content,
      this.groupTag,
      DateTime? createdAt,
      this.upVote = 0,
      this.downVote = 0})
      : createdAt = createdAt ?? Timestamp.now().toDate();

  static Post fromMap(Map<String, dynamic> data) {
    assert(data.containsKey("title"), "Missing title property");
    assert(data.containsKey("content"), "Missing content property");
    assert(data.containsKey("upvote"), "Missing upvote property");
    assert(data.containsKey("downvote"), "Missing downvote property");
    assert(data.containsKey("boardTag"), "Missing board tag property");
    assert(data.containsKey("groupTag"), "Missing group tag property");
    assert(data.containsKey("image"), "Missing image property");
    assert(data.containsKey("createdAt"), "Missing date property");

    return Post(
      title: data["title"],
      content: data["content"],
      upVote: data["upvote"],
      downVote: data["downvote"],
      boardTag: data["boardTag"],
      groupTag: data["groupTag"],
      createdAt: (data["createdAt"] as Timestamp).toDate(),
    );
  }
}
