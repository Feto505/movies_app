import 'package:flutter/material.dart';
import 'package:movie/core/theme/colors_palette.dart';

import '../../../core/config/page_routes_name.dart';
import '../../../data/models/similar.dart';

class SimilarMoviesWidget extends StatelessWidget {
  final ResultsSimilar resultsSimilar;

  const SimilarMoviesWidget({super.key, required this.resultsSimilar});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PageRoutesName.similarDetails,
            arguments: resultsSimilar);
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
                          // "https://image.tmdb.org/t/p/w500${resultsSimilar.posterPath}",
                          "https://image.tmdb.org/t/p/w500${resultsSimilar.posterPath}",
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
                      const Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: Icon(
                          Icons.star_purple500_sharp,
                          color: ColorsPalette.primaryColor,
                          size: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        resultsSimilar.voteAverage.toString(),
                        // "8.9",
                        style: theme.textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
                Text(
                  resultsSimilar.title.toString(),
                  style: theme.textTheme.displaySmall!.copyWith(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
                Text(
                  resultsSimilar.releaseDate.toString(),
                  style: theme.textTheme.displaySmall!
                      .copyWith(color: const Color(0xffB5B4B4), fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return Padding(
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
                    Image.network(
                      "https://image.tmdb.org/t/p/w500${resultsSimilar.posterPath}",
                      width: 96,
                      height: 130,
                    ),
                    Positioned(
                        left: 0,
                        top: 0,
                        child: ClipRRect(
                            child: Image.asset('assets/icons/bookmark1.png'))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.star_purple500_sharp,
                      color: ColorsPalette.primaryColor,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      resultsSimilar.voteAverage.toString(),
                      style: theme.textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
              Text(
                resultsSimilar.title.toString(),
                style: theme.textTheme.displaySmall,
              ),
              Text(
                resultsSimilar.releaseDate.toString(),
                style: theme.textTheme.displaySmall!
                    .copyWith(color: const Color(0xffB5B4B4)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
