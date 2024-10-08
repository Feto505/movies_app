import 'package:flutter/material.dart';
import 'package:movie/core/theme/colors_palette.dart';
import 'package:movie/features/pages/home/similar.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
            Image.asset(
              'assets/images/exmp3.png',
              fit: BoxFit.cover,
            ),
            const Text("data"),
            const Text("data"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Image.asset("assets/images/exem4.png"),
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
                        const Text(
                            'film details film details\n film details film details\n film detailsfilm details ')
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
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                        const SimilarMoviesWidget(),
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
      ),
    );
  }
}