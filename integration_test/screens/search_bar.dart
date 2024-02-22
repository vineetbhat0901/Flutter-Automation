import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r08fullmovieapp/RepeatedFunction/repttext.dart';
import '../constants/content_search.dart';
import '../finders/finders.dart';


class SearchField {
  late WidgetTester tester;

  SearchField(this.tester);


  final searchField = findByType(TextField);

  final contentListView = find.ancestor(of:findByTextContaining(ContentSearchConstants.movieDescription), matching: findByType(ListView));

  // final _contentClickableElement = find.ancestor(of:findByTextContaining(' The heroic story of a dictator who risks his life to ensure that democracy would never come to the country he so lovingly'), matching: find.byType(GestureDetector));

  final contentClickableElement = find.ancestor(of: findByTextContaining(ContentSearchConstants.movieDescription), matching: findByType(GestureDetector));

  final clearSearchIcon = find.byKey(const Key('clearSearch'));
  
  
  Future searchContent() async{
    await tester.enterText(searchField, ContentSearchConstants.movieName);
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  Future clearSearch() async {
    await tester.tap(clearSearchIcon);
    await tester.pump(const Duration(seconds: 3));
  }

  Future openContent() async {
   
    await tester.fling(contentListView, const Offset(0, -400), 1000);

    await tester.pump();
    await tester.tap(contentClickableElement,warnIfMissed: true);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 10));
  }

}