import 'dart:io';

import 'package:flutter/material.dart';

import 'core/config/app_router.dart';
import 'core/config/page_routes_name.dart';
import 'core/theme/app_theme_manager.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.themeData,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
