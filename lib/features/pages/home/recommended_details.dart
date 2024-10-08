import 'package:flutter/material.dart';
import 'package:movie/data/models/topRated.dart';

class RecommendedDetails extends StatelessWidget {
  const RecommendedDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var result = ModalRoute.of(context)!.settings.arguments as ResultsTopRated;
    var theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Color(0xff282A28),
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              "https://image.tmdb.org/3/movie/top_rated/t/p/w500${result.backdropPath}",
              // result.posterPath.toString(),
              // 'assets/images/exmp3.png',
              fit: BoxFit.cover,
            ),
            Text(result.title.toString()),
            Text(result.overview.toString()),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
