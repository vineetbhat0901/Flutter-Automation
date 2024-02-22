import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r08fullmovieapp/RepeatedFunction/repttext.dart';
import '../constants/content_search.dart';
import '../finders/finders.dart';

class Sidebar {
  late WidgetTester tester;

  Sidebar(this.tester);

  final homeTile = findByAncestor(findByText('Home'), findByType(ListTile ));
  
  final favouriteTile = findByAncestor(findByText('Favorite'), findByType(ListTile));
  
  final blogTile = findByAncestor(findByText('Our Blogs'), findByType(ListTile ));

  final websiteTile = findByAncestor(findByText('Our Website'), findByType(ListTile ));

  final subscribeTile = findByAncestor(findByText('Subscribe US'), findByType(ListTile ));

  final aboutTile = findByAncestor(findByText('About'), findByType(ListTile ));

  final quitTile = findByAncestor(findByText('Quit'), findByType(ListTile ));


  final favouriteItem = findByAncestor(findByText('Hazbin Hotel'), findByType(ListTile));

  final sortItems = findByText('View All');

  final sortByName = findByText('Sort by Name');

  final sortByRating = findByText('Sort by Rating');

  final alertMessage = findByText(AlertMessage.alertMessage);

  final okButton = findByText('Ok');


  Future goToFavourite() async {
    await tester.tap(favouriteTile);
    await tester.pumpAndSettle();

  }

  Future sort() async {
    await tester.tap(sortItems);
    await tester.pump(const Duration(seconds: 2));
  }

  Future clickOnFavourite() async {
    await tester.tap(favouriteItem);
    await tester.pumpAndSettle();
  }

  Future clickOnAbout() async {
    await tester.tap(aboutTile);
    await tester.pumpAndSettle();
  }

  Future dismissAlert() async {
    await tester.tap(okButton);
    await tester.pumpAndSettle();
  }
}