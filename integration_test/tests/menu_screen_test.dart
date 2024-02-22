import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:r08fullmovieapp/main.dart' as movie_app;
import '../constants/content_search.dart';
import '../fixtures/init_app.dart';
import '../screens/main_screen.dart';
import '../screens/search_bar.dart';
import '../screens/side_bar.dart';

void main(){
  final bindings = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  bindings.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('Menu Item tests', () {

    testWidgets('Check for the menu items', (tester) async {
      await initApp(tester);
      final mainScreen = MainScreen(tester);
      final menuSreen = Sidebar(tester);

      final scaffoldFinder = find.byType(Scaffold);
      final scaffoldState = tester.state<ScaffoldState>(scaffoldFinder);
      scaffoldState.openDrawer();
      await tester.pump(const Duration(seconds: 3));

      expect(menuSreen.homeTile, findsOneWidget);
      //all other expect for other tiles need to be written

      await menuSreen.goToFavourite();
      expect(menuSreen.sortItems, findsOneWidget);

      await menuSreen.sort();
      expect(menuSreen.sortByName, findsOneWidget);
      expect(menuSreen.sortByRating, findsOneWidget);
      await tester.tap(menuSreen.sortByRating);
      
      // await tester.pageBack();
      Navigator.pop(tester.element(find.byType(Scaffold)));
      await tester.pump(const Duration(seconds: 2));
      // await tester.pageBack();


      await menuSreen.clickOnAbout();
      expect(menuSreen.alertMessage, findsOneWidget);
      expect(menuSreen.okButton, findsOneWidget);

      await menuSreen.dismissAlert();
      await tester.pump(const Duration(seconds: 4));


  


    });
    
  });
}