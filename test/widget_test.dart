// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idata2503_group08/app/main_pages/add_new_post.dart';
import 'package:idata2503_group08/app/sign_in/login_page.dart';

import 'package:idata2503_group08/main.dart';
import 'package:idata2503_group08/services/auth.dart';

void main() {

  testWidgets('Add new post', (WidgetTester tester) async {
    final postTitle = find.byKey(ValueKey("postTitle"));
    final postDescription = find.byKey(ValueKey("postDescription"));
    final submitButton = find.byKey(ValueKey("submitButton"));

    await tester.pumpWidget(const MaterialApp(home: AddNewPost()));
    await tester.enterText(postTitle, "this is for testing");
    await tester.enterText(postDescription, "Even more testing");
    await tester.tap(submitButton);
    await tester.pump();
    
    expect(find.text("this is for testing"), findsOneWidget);
    expect(find.text("Even more testing"), findsOneWidget);

  });
}
