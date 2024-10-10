import 'package:flutter/material.dart';
import 'package:movie/data/models/movies_model.dart';

import '../../../../core/config/page_routes_name.dart';

class ReleasesMoviesWidget extends StatelessWidget {
  final Results results;

  const ReleasesMoviesWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PageRoutesName.releaseDetails,
            arguments: results);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              SizedBox(
                width: 96,
                height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${results.posterPath}",
                    // "assets/images/exmp.png",
                    // results.backdropPath.toString(),
                    width: 96,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  left: 0,
                  top: 0,
                  child: ClipRRect(
                      child: Image.asset('assets/icons/bookmark1.png'))),
            ],
          ),
        ),
      ),
    );
  }
}
