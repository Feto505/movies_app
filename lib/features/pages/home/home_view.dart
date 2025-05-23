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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: ColorsPalette.black2Color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 330,
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
                        List<ResultsPopular> articleList = snapshot.data ?? [];
                        // return CategoryViewDetails(sourceList: sourceList);
                        return Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                PopularWidget(results: articleList[index]),
                            itemCount: articleList.length,
                            // itemCount: 2,
                          ),
                        );
                      },
                    )),
                // SizedBox(
                //     height: 150,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) =>
                //            ReleasesMoviesWidget(results: ,),
                //       itemCount: 10,
                //     )),
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
                    height: 220,
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
                        List<Results> articleList = snapshot.data ?? [];
                        // return CategoryViewDetails(sourceList: sourceList);
                        return Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                ReleasesMoviesWidget(
                                    results: articleList[index]),
                            itemCount: articleList.length,
                            // itemCount: 2,
                          ),
                        );
                      },
                    )
                    // ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   itemBuilder: (context, index) =>
                    //       const RecommendedMoviesWidget(),
                    //   itemCount: 7,
                    // )
                    ),
                // SizedBox(
                //     height: 150,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) =>
                //            ReleasesMoviesWidget(results: ,),
                //       itemCount: 10,
                //     )),
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
                        List<ResultsTopRated> articleList = snapshot.data ?? [];
                        // return CategoryViewDetails(sourceList: sourceList);
                        return Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                // Column(
                                //   children: [
                                //     Center(
                                //       child: Text(articleList[index].title.toString(),style: const TextStyle(
                                //           color: Colors.red
                                //       ),),
                                //     ),
                                //     // Center(
                                //     //   child: Text(articleList[1].title.toString(),style: TextStyle(
                                //     //     color: Colors.red
                                //     //   ),),
                                //     // ),
                                //   ],
                                // ),
                                RecommendedMoviesWidget(
                                    results: articleList[index]),
                            itemCount: articleList.length,
                            // itemCount: 2,
                          ),
                        );
                      },
                    )
                    // ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   itemBuilder: (context, index) =>
                    //       const RecommendedMoviesWidget(),
                    //   itemCount: 7,
                    // )
                    ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
