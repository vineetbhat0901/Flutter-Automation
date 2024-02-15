import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r08fullmovieapp/RepeatedFunction/repttext.dart';
import '../finders/finders.dart';

class SearchField {
  late WidgetTester tester;

  SearchField(this.tester);

  final _searchField = findByType(TextField);

 

  final _contentDescription = findByTextContaining('The heroic story of a dictator who risks his life');
  final _contentListView = find.ancestor(of:findByTextContaining('The heroic story of a dictator who risks his life'), matching: findByType(ListView));
  // The heroic story of a dictator who risks his life

  Future searchContent() async{
    await tester.enterText(_searchField, 'dictator');
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  Future openContent() async {
    // await tester.ensureVisible(_contentCard);
    // await tester.scrollUntilVisible(
    //   _contentDescription,
    //   500.0,
    //   scrollable: _contentListView
    // );
    await tester.fling(_contentListView, Offset(0, -200), 2000);

    await tester.pump();
    await tester.tap(_contentDescription,warnIfMissed: true);
    await tester.pump(const Duration(seconds: 5));
  }

}