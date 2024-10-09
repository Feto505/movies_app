import 'package:flutter/material.dart';
import 'package:movie/core/theme/colors_palette.dart';
import 'package:movie/data/models/popular.dart';
import 'package:movie/data/models/topRated.dart';
import 'package:movie/data/models/upcoming.dart';
import 'package:movie/features/pages/home/popular_widget.dart';
import 'package:movie/features/pages/home/recommended_movies_widget.dart';
import 'package:movie/features/pages/home/releases_movies_widget.dart';

import '../../../data/data_sources/api_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  // final ResultsPopular? result;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ColorsPalette.black2Color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 280,
                      child: FutureBuilder<List<ResultsPopular>>(
                        future: ApiManager.fetchPopularMoviesList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text("Error fetching");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: ColorsPalette.primaryColor,
                              ),
                            );
                          }
                          List<ResultsPopular> resultList = snapshot.data ?? [];

                          return Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  PopularWidget(results: resultList[index]),
                              itemCount: resultList.length,
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
            // PopularWidget(results: result.backdropPath,),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: ColorsPalette.black2Color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding:
                          const EdgeInsets.only(left: 20, top: 15, bottom: 4),
                      child: Text(
                        "New Releases",
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: Colors.white),
                      )),
                  SizedBox(
                      height: 150,
                      child: FutureBuilder<List<Results>>(
                        future: ApiManager.fetchUpcomingMoviesList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text("Error fetching");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: ColorsPalette.primaryColor,
                              ),
                            );
                          }
                          List<Results> resultList = snapshot.data ?? [];
                          return Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  ReleasesMoviesWidget(
                                      results: resultList[index]),
                              itemCount: resultList.length,
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: ColorsPalette.black2Color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding:
                          const EdgeInsets.only(left: 20, top: 15, bottom: 4),
                      child: Text(
                        "Recommended",
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: Colors.white),
                      )),
                  SizedBox(
                      height: 220,
                      child: FutureBuilder<List<ResultsTopRated>>(
                        future: ApiManager.fetchTopRatedMoviesList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text("Error fetching");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: ColorsPalette.primaryColor,
                              ),
                            );
                          }
                          List<ResultsTopRated> resultList =
                              snapshot.data ?? [];

                          return Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  RecommendedMoviesWidget(
                                      results: resultList[index]),
                              itemCount: resultList.length,
                              // itemCount: 2,
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
