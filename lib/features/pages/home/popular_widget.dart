import 'package:flutter/material.dart';
import 'package:movie/data/models/popular.dart';

import '../../../core/config/page_routes_name.dart';

class PopularWidget extends StatelessWidget {
  final ResultsPopular results;

  const PopularWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Stack(
      // fit: StackFit.loose,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, PageRoutesName.movie_details,
                    arguments: results);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 8),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${results.backdropPath}",
                  // 'assets/images/exmp3.png',
                  fit: BoxFit.cover,
                  width: mediaQuery.width,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.height * .2,
              ),
              child: Text(results.title.toString()),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuery.height * .2),
              child: Text(results.releaseDate.toString()),
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
                      child: Image.network(
                    height: 160,
                    width: 120,
                    "https://image.tmdb.org/t/p/w500${results.posterPath}",
                  )),
                ],
              ),
              Positioned(
                left: 0,
                top: 0,
                child:
                    ClipRRect(child: Image.asset('assets/icons/bookmark1.png')),
              )
            ],
          ),
        ),
        // CarouselSlider(
        //
        //   // autoPlay: true,
        //   // pauseAutoPlayOnTouch: Duration(seconds: 5),
        //   // height: MediaQuery.of(context).size.height * 0.60,
        //   items: <Widget>[
        //     for (var i = 0; i < results.backdropPath!.length; i++)
        //       Container(
        //         margin: const EdgeInsets.only(top: 20.0, left: 20.0),
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: NetworkImage(results.backdropPath??''),
        //             fit: BoxFit.fitHeight,
        //           ),
        //           // border:
        //           //     Border.all(color: Theme.of(context).accentColor),
        //           borderRadius: BorderRadius.circular(32.0),
        //         ),
        //       ),
        //   ],
        //   options: CarouselOptions(height: 200),
        // ),
        // CarouselSlider.builder(
        //   itemCount: 15,
        //   itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
        //       Container(
        //         child: Text(itemIndex.toString()),
        //       ), options: CarouselOptions(height: 300),
        // ),
        /// 1
        // CarouselSlider(
        //     // items: items,
        //     // options: CarouselOptions(
        //     //   height: 400,
        //     //   aspectRatio: 16/9,
        //     //   viewportFraction: 0.8,
        //     //   initialPage: 0,
        //     //   enableInfiniteScroll: true,
        //     //   reverse: false,
        //     //   autoPlay: true,
        //     //   autoPlayInterval: Duration(seconds: 3),
        //     //   autoPlayAnimationDuration: Duration(milliseconds: 800),
        //     //   autoPlayCurve: Curves.fastOutSlowIn,
        //     //   enlargeCenterPage: true,
        //     //   enlargeFactor: 0.3,
        //     //   onPageChanged: callbackFunction,
        //     //   scrollDirection: Axis.horizontal,
        //     // )
        //   items: results.title!.map((i){
        //     return Container(
        //       width: MediaQuery.of(context).size.width,
        //       margin: const EdgeInsets.symmetric(horizontal: 5),
        //       decoration: BoxDecoration(
        //         color: Colors.red,
        //         borderRadius: BorderRadius.circular(10)
        //       ),
        //       child: Text("Text: $i"),
        //     );
        //   }),
        //   options: CarouselOptions(height: 200),
        // )
      ],
    );
  }
}
