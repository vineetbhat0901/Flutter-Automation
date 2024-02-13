import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


class MainScreen {
  late WidgetTester tester;

  MainScreen(this.tester);

  final _moviesTab = find.widgetWithText(TextField, 'Movies');

  Future checkMovieTab() async{
    await tester.tap(_moviesTab,warnIfMissed: true);
    await tester.pump(const Duration(seconds: 5));
  }
}