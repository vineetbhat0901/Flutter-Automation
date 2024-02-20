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
  // final _contentClickableElement = find.ancestor(of:findByTextContaining('The heroic story of a dictator who risks his life'), matching: find.byType(GestureDetector));
  // final _gestureDetect= findByType(GestureDetector);
  // final _middleware = find.ancestor(of: findByKey(const ValueKey('descContainer')).at(2), matching: findByType(GestureDetector));
  // final _contentClickableElement =find.ancestor(of: findByKey(const ValueKey('descContainer')).at(2), matching: findByType(GestureDetector));
  final _contentClickableElement = find.ancestor(of: findByText('2024-01-18'), matching: findByType(GestureDetector));

  
  Future searchContent() async{
    await tester.enterText(_searchField, 'dictator');
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  Future openContent() async {
   
    await tester.fling(_contentListView, Offset(0, -50), 700);

    await tester.pump();
    await tester.tap(_contentClickableElement.at(1),warnIfMissed: true);
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 10));
  }

}