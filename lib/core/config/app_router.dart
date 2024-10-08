import 'package:flutter/material.dart';
import 'package:movie/features/layout/layoutView.dart';
import 'package:movie/features/pages/home/movie_details.dart';
import 'package:movie/features/pages/home/recommended_details.dart';
import 'package:movie/features/pages/home/release_details.dart';

import '../../features/pages/splash/splash_view.dart';
import 'page_routes_name.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
      case PageRoutesName.layout:
        return MaterialPageRoute(
            builder: (context) => const LayOutView(), settings: settings);

      case PageRoutesName.movie_details:
        return MaterialPageRoute(
            builder: (context) => const MovieDetails(), settings: settings);
      case PageRoutesName.recommendedDetails:
        return MaterialPageRoute(
            builder: (context) => const RecommendedDetails(),
            settings: settings);
      case PageRoutesName.releaseDetails:
        return MaterialPageRoute(
            builder: (context) => const ReleasedDetails(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
    }
  }
}
