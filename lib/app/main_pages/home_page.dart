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

  Future<void> _signOut() async {
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigation(),
      bottomNavigationBar: BottomNavigation(),
      backgroundColor: const Color(0xFF1E1E1E),
      body: Center(
        child: Column(children: <Widget>[
          ElevatedButton(onPressed: _signOut, child: const Text("Logout")),
          _buildPostTitle(context),

          const PostCard(
              title: "Title2",
              content:
                  "this is an example of a similar user post but with \n multiple \n lines")
        ]),
      ),
    );
  }

  Widget _buildPostTitle(BuildContext context) {
    final Repository repository = Provider.of<Repository>(context);
    return StreamBuilder(
      stream: repository.getPostStream("post"),
      builder: (BuildContext context, AsyncSnapshot<Post?> snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return const Text("Loading...");
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Text("Loading...");
        }
        final Post post = snapshot.data!;
        return Text(post.title);
      },
    );
  }
}
