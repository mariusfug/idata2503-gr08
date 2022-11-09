import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:idata2503_group08/app/main_pages/home_page.dart';
import 'package:idata2503_group08/app/sign_in/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../services/database.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key, required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _updateUser(widget.auth.currentUser);
  }

  void _updateUser(User? user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignIn(key: const Key("userState"),
        auth: widget.auth,
        onSignIn: (user) => _updateUser(user!),
      );
    }
    return HomePage(
        auth: widget.auth,
        onSignOut: () => _updateUser(null),
    );
  }
}
