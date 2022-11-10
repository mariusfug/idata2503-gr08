import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:idata2503_group08/pages/landing_page.dart';
import 'package:idata2503_group08/services/auth.dart';
import 'package:idata2503_group08/services/firestore/firestore_repository.dart';
import 'package:idata2503_group08/services/repository.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Repository>(create: (context) => FirestoreRepository()),
        Provider<AuthBase>(create: (context) => Auth())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}
