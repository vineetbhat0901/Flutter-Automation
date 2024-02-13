import 'package:flutter_test/flutter_test.dart';
import 'package:r08fullmovieapp/main.dart' as movie_app;
Future<void> initApp(WidgetTester tester) async {
  await movie_app.main();
  await tester.pump(const Duration(seconds: 5));
}