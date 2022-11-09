import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idata2503_group08/app/posts/post_card.dart';

void main() {

  testWidgets("PostCard Works", (tester) async{

    await tester.pumpWidget(const PostCard(title: "Test", content: "TESTING IF WORK"));
    final titleFinder = find.text("test");
    final contentFinder = find.text("TESTING IF WORK");
      
    expect(titleFinder, findsOneWidget);
    expect(contentFinder, findsOneWidget);
  )};
}