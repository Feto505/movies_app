import 'package:flutter/material.dart';
import 'package:movie/core/theme/colors_palette.dart';

import '../../../core/config/page_routes_name.dart';
import '../../../data/models/topRated.dart';

class RecommendedMoviesWidget extends StatelessWidget {
  final ResultsTopRated results;

  const RecommendedMoviesWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PageRoutesName.recommendedDetails,
            arguments: results);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4, left: 10, bottom: 20),
        child: Card(
          elevation: 0.5,
          shadowColor: Colors.white,
          child: Container(
            width: 102,
            height: 185,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorsPalette.black3Color,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 96,
                        height: 130,
                        child: Image.network(
                          // "https://image.tmdb.org/t/p/w500${results.posterPath}",
                          "https://image.tmdb.org/3/movie/top_rated/t/p/w500${results.posterPath}",
                          // "assets/images/exmp2.png",
                          fit: BoxFit.cover,
                          // width: 96,
                          // height: 130,
                          // scale: 4,
                        ),
                      ),
                      Positioned(
                          left: 0,
                          top: 0,
                          child: ClipRRect(
                              child:
                                  Image.asset('assets/icons/bookmark1.png'))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: const Icon(
                          Icons.star_purple500_sharp,
                          color: ColorsPalette.primaryColor,
                          size: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        results.voteAverage.toString(),
                        // "8.9",
                        style: theme.textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
                Text(
                  results.title.toString(),
                  style: theme.textTheme.displaySmall!.copyWith(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
                Text(
                  results.releaseDate.toString(),
                  style: theme.textTheme.displaySmall!
                      .copyWith(color: const Color(0xffB5B4B4), fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
