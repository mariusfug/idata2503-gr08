import '../model/group.dart';
import '../model/post.dart';

abstract class Repository {
  Stream<Iterable<Post>> getPostsStream(String postId, String orderBy);
  Stream<Iterable<Group>> getGroupsStream(String orderBy);

  Future addPostWithAutogeneratedId(
      String collection, Post post);
  Future addGroupWithAutogeneratedId(Group group);
}
