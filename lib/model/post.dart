
class Post {
  final String title;
  final String content;

  Post(this.title, this.content);

  static Post fromMap(Map<String, dynamic> data) {
    assert(data.containsKey("title"), "Missing title property");
    assert(data.containsKey("content"), "Missing content property");

    return Post(data["title"], data["content"]);
  }
}