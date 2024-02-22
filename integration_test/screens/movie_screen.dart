import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:r08fullmovieapp/RepeatedFunction/repttext.dart';
import '../finders/finders.dart';


class MovieScreen {
  late WidgetTester tester;
  MovieScreen(this.tester);

  final favouriteButton = findByKey(const ValueKey('favButton'));

  final backButton = findByKey(const ValueKey('backButton'));

  final shareButton = findByKey(const ValueKey('shareButton'));

  // final creatorDetail = findByText('Created By : ');
  final creatorDetail = find.byWidgetPredicate((widget) {
      if (widget is Text) {
        return 
            widget.data == 'Created By : ';
      }
      return false;
    });

  final genreList = findByKey(const ValueKey('genre'));

  final releaseDate = find.byWidgetPredicate((widget) {
      if (widget is Text) {
        return 
         widget.data?.contains('Release date :') ?? false;
      }
      return false;
    });

  final alertBox = findByType(AlertDialog);

  final copyLinkButton = findByAncestor(findByKey(const ValueKey('copyIcon')),findByType(GestureDetector));

  final copiedToastMessage = findByType(Fluttertoast);

  Future addToFavourite() async {
    await tester.tap(favouriteButton);
    await tester.pump(const Duration(seconds: 2));
  }

  Future clickOnShareButton() async{
    await tester.tap(shareButton, warnIfMissed: false);
    await tester.pumpAndSettle();
  }

  Future clickOnCopyLink() async {
    await tester.tap(copyLinkButton, warnIfMissed: false);
    await tester.pumpAndSettle();
  }

  Future goBack() async {
    await tester.tap(backButton);
    await tester.pump(const Duration(seconds: 2));
  }

  
}