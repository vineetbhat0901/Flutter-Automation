import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r08fullmovieapp/RepeatedFunction/repttext.dart';
import '../finders/finders.dart';

class Sidebar {
  late WidgetTester tester;

  Sidebar(this.tester);

  final _favouriteTile = findByAncestor(findByText('Favorite'), findByType(ListTile));

  final _favouriteItem = findByAncestor(findByText('Hazbin Hotel'), findByType(ListTile));


  Future goToFavourite() async {
    await tester.tap(_favouriteTile);
    await tester.pumpAndSettle();

  }

  Future clickOnFavourite() async {
    await tester.tap(_favouriteItem);
    await tester.pumpAndSettle();
  }
}