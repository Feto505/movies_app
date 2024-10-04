import 'package:flutter/material.dart';

class ReleasesMoviesWidget extends StatelessWidget {
  const ReleasesMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/exmp.png",
              width: 96,
              height: 130,
            ),
            Positioned(
                left: 0,
                top: 0,
                child:
                    ClipRRect(child: Image.asset('assets/icons/bookmark.png'))),
          ],
        ),
      ),
    );
  }
}
