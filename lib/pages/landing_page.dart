import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:idata2503_group08/pages/main_pages/feed.dart';
import 'package:idata2503_group08/pages/sign_in/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../services/firestore/api_paths.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          final User? user = snapshot.data;
          if (user == null) {
            return SignIn(auth: auth);
          }
          return Feed(groupId: ApiPaths.group("general"),);
        });
  }
}
