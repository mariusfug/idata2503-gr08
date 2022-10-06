import 'package:flutter/cupertino.dart';
import 'package:idata2503_group08/app/sign_in/login_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  User _user;

  @override
  Widget build(BuildContext context) {
    return const SignIn();
  }
}
