import 'package:flutter/material.dart';
import 'package:idata2503_group08/app/posts/post_card.dart';
import 'package:provider/provider.dart';
import '../../model/post.dart';
import '../../services/auth.dart';
import '../../services/repository.dart';
import '../navigation/bottom_navigation.dart';
import '../navigation/top_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.auth, required this.onSignOut});

  final AuthBase auth;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigation(),
      bottomNavigationBar: BottomNavigation(),
      backgroundColor: const Color(0xFF1E1E1E),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => _signOut, child: const Text("Logout")),
              _buildPostCards(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Build post cards from all entries in general
  Widget _buildPostCards(BuildContext context) {
    final Repository repository =
        Provider.of<Repository>(context, listen: false);
    return StreamBuilder<Iterable<Post>?>(
      stream: repository.getPostsStream("general/posts"),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active ||
            !snapshot.hasData ||
            snapshot.data == null) {
          return const Text("Loading...");
        }
        final Iterable<Post> posts = snapshot.data!;
        final List<PostCard> postCards =
            posts.map((post) => PostCard(post)).toList();

        return Column(children: postCards);
      },
    );
  }

  Future<void> _signOut() async {
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
