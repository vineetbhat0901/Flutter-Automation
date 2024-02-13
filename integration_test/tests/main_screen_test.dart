import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:r08fullmovieapp/main.dart' as movie_app;
import '../fixtures/init_app.dart';
import '../screens/main_screen.dart';

void main(){
  final bindings = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  bindings.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('MainScreen functionalities', () {

    
    testWidgets('click on Movies', (tester) async {
      await initApp(tester);

      final _mainScreen = MainScreen(tester);
      await _mainScreen.checkMovieTab();
    },
    skip: false,
    timeout: const Timeout(Duration(minutes: 5)),
    );
    
  });
}