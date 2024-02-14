import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r08fullmovieapp/RepeatedFunction/repttext.dart';
import '../finders/finders.dart';

class MainScreen {
  late WidgetTester tester;

  MainScreen(this.tester);


  final _moviesTab =find.descendant(
      of: findByType(TabBar),
      matching: findByText("Movies"),
  );

  final _upcomingShowsTab =find.descendant(
      of: findByType(TabBar),
      matching: findByText("Upcoming"),
  );

  final _tvSeriesTab =find.descendant(
      of: findByType(TabBar),
      matching: findByText("Tv Series"),
  );


  final _popularNow = find.descendant(
      of: findByType(TabBarView),
      matching: findByText('Popular Now'),
  );
  final _nowPlaying = find.descendant(
      of: findByType(TabBarView),
      matching: findByText('Now Playing'),
  );
  final _topRated = find.descendant(
      of: findByType(TabBarView),
      matching: findByText('Top Rated'),
  );
  final _upcomingText = find.descendant(
      of: findByType(TabBarView),
      matching: findByText('Upcomming'),
  );

  final _manyMoreComingSoon = find.descendant(
      of: findByType(TabBarView),
      matching: findByText('Many More Coming Soon... '),
  );

  final _onAirNow = find.descendant(
      of: findByType(TabBarView),
      matching: findByText('On Air Now'),
  );


  Future checkMovieTab() async{
    await tester.tap(_moviesTab,warnIfMissed: true);
    await tester.pump(const Duration(seconds: 5));
    // expect(_moviesTab, findsOneWidget);
    await tester.pump();

    expect(_popularNow, findsOneWidget);
    expect(_nowPlaying, findsOneWidget);
    expect(_topRated, findsOneWidget);
  }

  Future checkUpcomingShowsTab() async {
    await tester.tap(_upcomingShowsTab,warnIfMissed: true);
    await tester.pump(const Duration(seconds: 5));

    expect(_upcomingText, findsOneWidget);
    expect(_manyMoreComingSoon, findsOneWidget);
  }

  Future checkTvSeriesTab() async {
    await tester.tap(_tvSeriesTab, warnIfMissed: true);
    await tester.pump(const Duration(seconds: 5));

    expect(_popularNow, findsOne);
    expect(_onAirNow, findsOneWidget);
    expect(_topRated, findsOne);
  }
  
}