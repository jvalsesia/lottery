import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:lottery/common/contants.dart';
import 'package:lottery/common/current_page.dart';
import 'package:lottery/pages/home_page.dart';
import 'package:lottery/pages/mm_page.dart';
import 'package:lottery/pages/ms_page.dart';
import 'package:window_size/window_size.dart';

const double windowWidth = 400;
const double windowHeight = 800;

var logger = Logger();

final pages = [
  CurrentPage(
      name: 'Home', route: 'home', builder: (context) => const HomePage()),
  CurrentPage(
      name: 'MegaSena',
      route: 'megasena',
      builder: (context) => const MegaSenaPage()),
  CurrentPage(
      name: 'MegaMillions',
      route: 'megamillions',
      builder: (context) => const MegaMillionsPage()),
];

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Provider CurrentScreen');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

void main() {
  logger.i("Logger is working!");
  runApp(const MyApp());
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        for (final currentPage in pages)
          GoRoute(
            path: currentPage.route,
            builder: (context, state) => currentPage.builder(context),
          ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MyApp CurrentScreen',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kAppLightBlueBackgroundColor,
        ),
        scaffoldBackgroundColor: kHomeLightGreyBackgroundColor,
      ),
      routerConfig: router,
    );
  }
}
