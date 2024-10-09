import 'package:flutter/material.dart';
import 'package:movie/core/theme/colors_palette.dart';
import 'package:movie/data/models/popular.dart';
import 'package:movie/data/models/similar.dart';
import 'package:movie/features/pages/home/similar.dart';

import '../../../data/data_sources/api_manager.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var result = ModalRoute.of(context)!.settings.arguments as ResultsPopular;
    // List<String> f=result.overview.toString().split('');
    return Scaffold(
      // backgroundColor: Color(0xff282A28),
      appBar: AppBar(
        title: Text(result.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${result.backdropPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '${result.title}',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text('${result.releaseDate}',
                      style: theme.textTheme.displaySmall!
                          .copyWith(color: Colors.white54)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('popularity: ${result.popularity}',
                      style: theme.textTheme.displaySmall!
                          .copyWith(color: Colors.white54)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              width: 110,
                              height: 160,
                              "https://image.tmdb.org/t/p/w500${result.posterPath}",
                            ),
                          ),
                        ),
                        Positioned(
                            left: 1,
                            top: 10,
                            child: ClipRRect(
                                child:
                                    Image.asset('assets/icons/bookmark1.png'))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: const Text("data"),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: const Text("data"),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: const Text("data"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: 215,
                          child: Column(
                            children: [
                              Text(
                                result.overview.toString(),
                                style: theme.textTheme.displaySmall,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: ColorsPalette.primaryColor,
                                  ),
                                  Text(result.voteAverage.toString()),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
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
                        "More Like This",
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: Colors.white),
                      )),
                  SizedBox(
                      height: 220,
                      child: FutureBuilder<List<ResultsSimilar>>(
                        future: ApiManager.fetchSimilarMoviesList(result.id),
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
                          List<ResultsSimilar> resultList = snapshot.data ?? [];
                          return Expanded(
                            child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                                  SimilarMoviesWidget(
                                      resultsSimilar: resultList[index]),
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
          ],
        ),
      ),
    );
  }
}
