import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idata2503_group08/model/post.dart';
import 'api_paths.dart';

import '../repository.dart';

class FirestoreRepository implements Repository {
  final FirebaseFirestore posts = FirebaseFirestore.instance;

  @override
  Stream<Iterable<Post>> getPostsStream(String postId) =>
      _getCollectionStream(ApiPaths.posts(postId), Post.fromMap);

  Stream<T?> _getDocumentStream<T>(
      String path, T Function(Map<String, dynamic>) converter) {
    print("Get document at $path");

    final Stream<DocumentSnapshot<Map<String, dynamic>>> snapshots =
        posts.doc(path).snapshots();

    return snapshots.map((documentSnapshot) {
      final Map<String, dynamic>? document = documentSnapshot.data();
      return document != null ? converter(document) : null;
    });
  }

  Stream<Iterable<T>> _getCollectionStream<T>(
      String path, T Function(Map<String, dynamic>) converter) {
    print("Get collection items at $path");

    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshots =
        posts.collection(path).snapshots();

    return snapshots.map((collectionSnapshot) {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
          collectionSnapshot.docs;
      return documents
          .map((QueryDocumentSnapshot<Map<String, dynamic>> document) {
        final Map<String, dynamic> data = document.data();
        return converter(data);
      });
    });
  }
}
