import '../model/post.dart';

abstract class Repository {
  Stream<Post?> getPostStream(String postId);
}