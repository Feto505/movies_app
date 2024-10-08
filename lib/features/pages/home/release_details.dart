import 'package:flutter/material.dart';
import 'package:movie/data/models/upcoming.dart';

class ReleasedDetails extends StatelessWidget {
  const ReleasedDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var result = ModalRoute.of(context)!.settings.arguments as Results;
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
            Image.network(
              "https://image.tmdb.org/t/p/w500${result.backdropPath}",
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
