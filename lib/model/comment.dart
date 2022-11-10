class Comment {
  final String content;
  final int upVote;
  final int downVote;

  Comment(this.content, this.upVote, this.downVote);

  static Comment fromMap(Map<String, dynamic> data) {
    assert(data.containsKey("comment"), "Missing content property");
    assert(data.containsKey("upvote"), "Missing upvote property");
    assert(data.containsKey("downvote"), "Missing downvote property");

    return Comment(
      data["content"],
      data["upvote"],
      data["downvote"],
    );
  }
}
