import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r08fullmovieapp/RepeatedFunction/repttext.dart';
import '../finders/finders.dart';


class MovieScreen {
  late WidgetTester tester;
  MovieScreen(this.tester);

  final _favouriteButton = findByKey(const ValueKey('favButton'));

  final _backButton = findByKey(const ValueKey('backButton'));


  Future addToFavourite() async {
    await tester.tap(_favouriteButton);
    await tester.pump(const Duration(seconds: 3));
  }

  Future goBack() async {
    await tester.tap(_backButton);
    await tester.pump(const Duration(seconds: 4));
  }

  
}