import 'package:flutter/material.dart';
import 'package:idata2503_group08/main_pages/home_page.dart';

import 'main_pages/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
<<<<<<< HEAD
      home: LoginPage(),
=======
      home: HomePage(),
      debugShowCheckedModeBanner: false,
>>>>>>> main
    );
  }
}

