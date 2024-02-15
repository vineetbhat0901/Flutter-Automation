import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:r08fullmovieapp/main.dart' as movie_app;
import '../fixtures/init_app.dart';
import '../screens/main_screen.dart';
import '../screens/search_bar.dart';

void main(){
  final bindings = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  bindings.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('MainScreen functionalities', () {

    
    testWidgets('click on tabs', (tester) async {
      await initApp(tester);

      final _mainScreen = MainScreen(tester);
      await _mainScreen.checkMovieTab();
      await tester.pump();
      await _mainScreen.checkUpcomingShowsTab();
      await tester.pump();
      await _mainScreen.checkTvSeriesTab();
    
    },
    skip: true,
    timeout: const Timeout(Duration(minutes: 5)),
    );

    testWidgets('Search for content and click on It', (tester) async {
      await initApp(tester);
      final _searchContent = SearchField(tester);
      await _searchContent.searchContent();
      await tester.pump(const Duration(seconds: 5));
      await _searchContent.openContent();

    },
    skip: false,
    timeout: const Timeout(Duration(minutes: 5)),
    );
     
  });
}