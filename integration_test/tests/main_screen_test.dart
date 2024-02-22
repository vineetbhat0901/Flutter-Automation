import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:r08fullmovieapp/main.dart' as movie_app;
import '../constants/content_search.dart';
import '../fixtures/init_app.dart';
import '../screens/main_screen.dart';
import '../screens/search_bar.dart';

void main(){
  final bindings = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  bindings.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('MainScreen functionalities', () {

    testWidgets('existance of tabs & click on tabs', (tester) async {
      //open app
      await movie_app.main();
      final mainScreen = MainScreen(tester);
      await mainScreen.checkSplashScreen();
      await tester.pump(const Duration(seconds: 5));

      expect(mainScreen.trendingWidget, findsOneWidget);

      expect(mainScreen.weekly, findsOneWidget);

      await mainScreen.tryToggle();

      await mainScreen.checkMovieTab();

      await tester.pump();
      await mainScreen.checkUpcomingShowsTab();

      await tester.pump();
      await mainScreen.checkTvSeriesTab();

    },
    skip: false,
    timeout: const Timeout(Duration(minutes: 5)),
    );

    testWidgets('Search for content and click on It', (tester) async {
      //open app
      await initApp(tester);
      final searchContent = SearchField(tester);

      await searchContent.searchContent();
      final String enteredText = tester.widget<TextField>(searchContent.searchField).controller!.text;
      expect(enteredText, ContentSearchConstants.movieName);

      await tester.pump(const Duration(seconds: 2));
      expect(searchContent.clearSearchIcon, findsOneWidget);

      await searchContent.clearSearch();
      final String textAfterClearing = tester.widget<TextField>(searchContent.searchField).controller!.text;
      expect(textAfterClearing,'');

      await tester.pump();
 
    },
    skip: false,
    timeout: const Timeout(Duration(minutes: 5)),
    );
     
  });
}