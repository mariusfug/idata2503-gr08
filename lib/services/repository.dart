import '../model/post.dart';

abstract class Repository {
  Stream<Iterable<Post>> getPostsStream(String postId);
}