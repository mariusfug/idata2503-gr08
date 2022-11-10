import 'package:flutter_test/flutter_test.dart';
import 'package:idata2503_group08/app/posts/post_card.dart';
import 'package:idata2503_group08/model/post.dart';

void main() {

  testWidgets("PostCard Works", (tester) async {
    await tester.pumpWidget(
        PostCard(Post("title", "content")));
    final titleFinder = find.text("Test");
    final contentFinder = find.text("TESTING IF WORK");

    expect(titleFinder, findsOneWidget);
    expect(contentFinder, findsOneWidget);
  });
}