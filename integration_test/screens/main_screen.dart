import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r08fullmovieapp/RepeatedFunction/repttext.dart';
import '../finders/finders.dart';

class MainScreen {
  late WidgetTester tester;

  MainScreen(this.tester);

  final moviesTab =find.descendant(
      of: findByType(TabBar),
      matching: findByText("Movies"),
  );

  final upcomingShowsTab =find.descendant(
      of: findByType(TabBar),
      matching: findByText("Upcoming"),
  );

  final tvSeriesTab =find.descendant(
      of: findByType(TabBar),
      matching: findByText("Tv Series"),
  );


  final popularNow = find.descendant(
      of: findByType(TabBarView),
      matching: findByText('Popular Now'),
  );
  final nowPlaying = find.descendant(
      of: findByType(TabBarView),
      matching: findByText('Now Playing'),
  );
  final topRated = find.descendant(
      of: findByType(TabBarView),
      matching: findByText('Top Rated'),
  );
  final upcomingText = find.descendant(
      of: findByType(TabBarView),
      matching: findByText('Upcomming'),
  );

  final manyMoreComingSoon = find.descendant(
      of: findByType(TabBarView),
      matching: findByText('Many More Coming Soon... '),
  );

  final onAirNow = find.descendant(
      of: findByType(TabBarView),
      matching: findByText('On Air Now'),
  );

  final randomContentCard = find.ancestor(of: findByText('2024-01-18'), matching: findByType(GestureDetector));

  final trendingWidget = findByText('Trending' + ' 🔥');

  final dropDownButton = findByType(DropdownButton);

  final weekly = findByText('Weekly');
  final daily = findByText('Daily');


  Future checkSplashScreen() async {
    await tester.pumpAndSettle();
      expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.data == 'By Niranjan dahal',
      ),
      findsOneWidget,
    );
  }

  Future tryToggle() async {
    await tester.tap(weekly,warnIfMissed: true);
    await tester.pump(const Duration(seconds: 3));
    expect(daily, findsOneWidget);

    await tester.tap(daily,warnIfMissed: true);
    await tester.pump(const Duration(seconds: 3));
  }
  
  Future toggleTrending() async {
    await tester.tap(dropDownButton,warnIfMissed: false);
    await tester.pump();
    await tester.tap(weekly,warnIfMissed: false);
    await tester.pump(const Duration(seconds: 4));
    await tester.tap(dropDownButton,warnIfMissed: false);
    await tester.pump();
    await tester.tap(daily,warnIfMissed: false);
    await tester.pump(const Duration(seconds: 4));
  }

  Future tapOnContent() async {
    await tester.fling(tvSeriesTab, const Offset(0, -1000), 1000);
    await tester.pump(const Duration(seconds: 4));
    await tester.tap(randomContentCard);
    await tester.pumpAndSettle();
  }

  Future checkMovieTab() async{
    await tester.tap(moviesTab,warnIfMissed: true);
    await tester.pump(const Duration(seconds: 5));
    // expect(_moviesTab, findsOneWidget);
    await tester.pump();

    expect(popularNow, findsOneWidget);
    expect(nowPlaying, findsOneWidget);
    expect(topRated, findsOneWidget);
  }

  Future checkUpcomingShowsTab() async {
    await tester.tap(upcomingShowsTab,warnIfMissed: true);
    await tester.pump(const Duration(seconds: 5));

    expect(upcomingText, findsOneWidget);
    expect(manyMoreComingSoon, findsOneWidget);
  }

  Future checkTvSeriesTab() async {
    await tester.tap(tvSeriesTab, warnIfMissed: true);
    await tester.pump(const Duration(seconds: 5));

    expect(popularNow, findsOne);
    expect(onAirNow, findsOneWidget);
    expect(topRated, findsOne);
  }
  
}