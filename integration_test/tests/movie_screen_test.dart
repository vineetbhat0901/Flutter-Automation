import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../constants/content_search.dart';
import '../finders/finders.dart';
import '../fixtures/init_app.dart';
import '../screens/main_screen.dart';
import '../screens/movie_screen.dart';
import '../screens/side_bar.dart';

void main(){
  final bindings = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  bindings.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('Second screen test', () {
    testWidgets('Should contain series details', (tester) async {
      await initApp(tester);
      final mainScreen = MainScreen(tester);
      final movieScreen = MovieScreen(tester);

      await mainScreen.tapOnContent();
      expect(movieScreen.creatorDetail, findsOneWidget);

      final genre = tester.widgetList<Text>(find.descendant(
      of: movieScreen.genreList,
      matching: findByType(Text),
      ));
      List<String> extractedTextList = genre.map((textWidget) => textWidget.data!).toList();
      expect(extractedTextList, ContentSearchConstants.seriesGenre);


      await tester.fling(movieScreen.creatorDetail, const Offset(0, -200), 1000,warnIfMissed: false);
      expect(movieScreen.releaseDate, findsOneWidget);
      expect(movieScreen.backButton, findsOneWidget);

    // Extract text values from Text widgets
      await tester.fling(movieScreen.creatorDetail, const Offset(0, 200), 1000,warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(movieScreen.favouriteButton, findsOneWidget);
      
      await movieScreen.clickOnShareButton();
      expect(movieScreen.alertBox, findsOneWidget);
      expect(movieScreen.copyLinkButton, findsOneWidget);

      await movieScreen.clickOnCopyLink();
      expect(movieScreen.backButton, findsOneWidget);


      await movieScreen.goBack();

    
    },
    skip: false,
    timeout: const Timeout(Duration(minutes: 5)),
    );
    

    testWidgets('should be able to add series to favourites', (tester) async {
      await initApp(tester);
      final mainScreen = MainScreen(tester);
      final movieScreen = MovieScreen(tester);
      final sideBar = Sidebar(tester);

      await mainScreen.tapOnContent();
      await tester.pumpAndSettle();
      await movieScreen.addToFavourite();

      // await movieScreen.addToFavourite();
      // expect(findByText('Added to Favorite'),findsOneWidget);

      // await movieScreen.addToFavourite();
      // expect(findByText('Removed from Favorite'),findsOneWidget);
      await movieScreen.goBack();

      await Future.delayed(const Duration(seconds: 2));
      final scaffoldFinder = find.byType(Scaffold);
      // Access the scaffold state
      final scaffoldState = tester.state<ScaffoldState>(scaffoldFinder);
      scaffoldState.openDrawer();
      await tester.pumpAndSettle();
      await sideBar.goToFavourite();
      await sideBar.clickOnFavourite();
      await tester.pump(const Duration(seconds: 2));
    },
    skip: false,
    timeout: const Timeout(Duration(minutes: 5)),
    );
    
  });
}