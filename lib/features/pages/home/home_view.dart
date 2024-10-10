import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/theme/colors_palette.dart';
import 'package:movie/data/models/movies_model.dart';
import 'package:movie/features/pages/home/widgets/releases_movies_widget.dart';

import '../../../data/data_sources/api_manager.dart';
import 'widgets/popular_widget.dart';
import 'widgets/recommended_movies_widget.dart';

class HomeView extends StatelessWidget {
  // final ResultsPopular result;
  const HomeView({
    super.key,
    // required this.result
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
                      height: 270,
                      child: FutureBuilder<List<Results>>(
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
                          List<Results> resultList = snapshot.data ?? [];

                          return Expanded(
                            child: CarouselSlider.builder(
                              itemBuilder: (context, index, realIndex) =>
                                  PopularWidget(results: resultList[index]),
                              itemCount: resultList.length,
                              options: CarouselOptions(
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  viewportFraction: 1,
                                  aspectRatio: 12 / 9),
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
                      child: FutureBuilder<List<Results>>(
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
                          List<Results> resultList = snapshot.data ?? [];

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
