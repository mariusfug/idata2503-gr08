import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idata2503_group08/model/post.dart';
import 'api_paths.dart';

import '../repository.dart';

class FirestoreRepository implements Repository {
  final FirebaseFirestore posts = FirebaseFirestore.instance;

  @override
  Stream<Post?> getPostStream(String postId) {
    final Stream<DocumentSnapshot<Map<String, dynamic>>> snapshots =
        posts.doc(ApiPaths.posts(postId)).snapshots();

    return snapshots.map(_convertSnapshotToPost);
  }

  Post? _convertSnapshotToPost(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final Map<String, dynamic>? data = snapshot.data();
    if (data != null &&
        data.containsKey("title") &&
        data.containsKey("content")) {
      return Post(data["title"], data["content"]);
    } else {
      return null;
    }
  }
}
