import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:r08fullmovieapp/main.dart' as movie_app;
import '../fixtures/init_app.dart';
import '../screens/main_screen.dart';
import '../screens/movie_screen.dart';
import '../screens/side_bar.dart';

void main(){
  final bindings = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  bindings.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('Second screen test', () {
    testWidgets('Should contain movie details', (tester) async {
      await initApp(tester);
      final _mainScreen = MainScreen(tester);
      final _movieScreen = MovieScreen(tester);
      final _sideBar = Sidebar(tester);

      await _mainScreen.tapOnContent();

      await _movieScreen.addToFavourite();
      await _movieScreen.goBack();

      final scaffoldFinder = find.byType(Scaffold);

      // Access the scaffold state
      final scaffoldState = tester.state<ScaffoldState>(scaffoldFinder);
      scaffoldState.openDrawer();
      await tester.pumpAndSettle();
      // await tester.pump(const Duration(seconds: 2));
      await _sideBar.goToFavourite();
      await _sideBar.clickOnFavourite();
      await tester.pump(const Duration(seconds: 2));

      //assertions to write
    });
    
  });
}