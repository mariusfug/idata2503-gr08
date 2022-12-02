import 'package:flutter/material.dart';
import 'package:idata2503_group08/widgets/navigation/top_navigation.dart';
import 'package:idata2503_group08/widgets/post_card.dart';
import 'package:provider/provider.dart';
import '../../model/post.dart';
import '../../services/auth.dart';
import '../../services/repository.dart';
import '../../widgets/navigation/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: TopNavigation(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => _signOut(context),
                  child: const Text("Logout")),
              _buildPostCards(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  /// Build post cards from all entries in general
  Widget _buildPostCards(BuildContext context) {
    final Repository repository =
        Provider.of<Repository>(context, listen: false);
    return StreamBuilder<Iterable<Post>?>(
      stream: repository.getPostsStream("general/posts", "createdAt"),
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

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
