import 'package:flutter/material.dart';
import 'package:movie/core/theme/colors_palette.dart';
import 'package:movie/data/models/similar.dart';

class SimilarDetails extends StatelessWidget {
  const SimilarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var result = ModalRoute.of(context)!.settings.arguments as ResultsSimilar;
    var theme = Theme.of(context);
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
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${result.backdropPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 15, top: 10, right: 15, bottom: 10),
              padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
              height: 120,
              width: 300,
              color: Colors.black12,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text(result.title.toString()),
                    Text('<${result.originalTitle}>'),
                    const Divider(
                      color: Colors.white54,
                    ),
                    Row(
                      children: [
                        const Text('Release: '),
                        Text(
                          '${result.releaseDate}',
                          style: theme.textTheme.displaySmall,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            const Text('Rate: '),
                            Icon(
                              Icons.star,
                              color: ColorsPalette.primaryColor,
                              size: 17,
                            ),
                            Text(
                              '${result.voteCount} -> ${result.voteAverage} ',
                              style: theme.textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 15, top: 10, right: 15, bottom: 30),
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 10, bottom: 8),
              height: 250,
              width: 300,
              color: Colors.black12,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const Text("Overview"),
                    const Divider(
                      color: Colors.white54,
                    ),
                    Text(result.overview.toString()),
                  ],
                ),
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
