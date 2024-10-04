import 'package:flutter/material.dart';
import 'package:movie/core/config/page_routes_name.dart';
import 'package:movie/core/theme/colors_palette.dart';
import 'package:movie/features/pages/home/recommended_movies_widget.dart';
import 'package:movie/features/pages/home/releases_movies_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, PageRoutesName.movie_details);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 8),
                      child: Image.asset(
                        'assets/images/exmp3.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQuery.height * .2),
                    child: const Text("data"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQuery.height * .2),
                    child: const Text("data data"),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                bottom: -1,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                            child: Image.asset("assets/images/exem4.png")),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: ClipRRect(
                          child: Image.asset('assets/icons/bookmark1.png')),
                    )
                  ],
                ),
              ),
            ],
          ),
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          const ReleasesMoviesWidget(),
                      itemCount: 10,
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          const RecommendedMoviesWidget(),
                      itemCount: 7,
                    )),
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
