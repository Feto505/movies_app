import 'package:flutter/material.dart';
import 'package:movie/data/models/popular.dart';

import '../../../core/config/page_routes_name.dart';

class PopularWidget extends StatelessWidget {
  final ResultsPopular results;
  const PopularWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Column(
      children: [
        // const SizedBox(height: 20,),
        /* // CarouselSlider(
        //   options: CarouselOptions(height: 400.0),
        //
        //   // items: results.backdropPath?.map((i) {
        //   //   return
        //   //     Builder(
        //   //     builder: (BuildContext context) {
        //   //       return Container(
        //   //           width: MediaQuery.of(context).size.width,
        //   //           margin: EdgeInsets.symmetric(horizontal: 5.0),
        //   //           decoration: BoxDecoration(
        //   //               color: Colors.amber
        //   //           ),
        //   //           child: Text('text $i', style: TextStyle(fontSize: 16.0),)
        //   //       );
        //   //     },
        //   //   );
        //   // }).toList(),
        //
        //   items: results.backdropPath?.map((i) {
        //     return
        //       Builder(
        //       builder: (BuildContext context) {
        //         return Container(
        //             width: MediaQuery.of(context).size.width,
        //             margin: EdgeInsets.symmetric(horizontal: 5.0),
        //             decoration: BoxDecoration(
        //                 color: Colors.amber
        //             ),
        //             child: Text('text $i', style: TextStyle(fontSize: 16.0),)
        //         );
        //       },
        //     );
        //   }).toList(),
        // ),
        // CarouselSlider.builder(
        //   itemCount: 15,
        //   itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
        //       Container(
        //         child: Image.network(itemIndex.toString()),
        //       ),
        //   options: CarouselOptions( height: 300),
        // ),
    CarouselSlider(
         // items: items,
         options: CarouselOptions(
          height: 400,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
      items: results.backdropPath?.map((i){
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Image.network(i),
        );
      }).toList(),
      // options: CarouselOptions(height: 200),
    )
        /*
        const SizedBox(height: 20,),
        */ */
        Stack(
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
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500${results.backdropPath}",
                        // 'assets/images/exmp3.png',
                        fit: BoxFit.cover,
                        width: mediaQuery.width,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: mediaQuery.height * .2,
                  ),
                  child: Text(
                    results.title.toString(),
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: mediaQuery.height * .2),
                  child: Text(
                    results.releaseDate.toString(),
                    style: theme.textTheme.displaySmall,
                  ),
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
                          child: Container(
                        height: 160,
                        width: 100,
                        child: Image.network(
                          fit: BoxFit.cover,
                          height: 160,
                          width: 100,
                          "https://image.tmdb.org/t/p/w500${results.posterPath}",
                        ),
                      )),
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
        ),
      ],
    );
  }
}
