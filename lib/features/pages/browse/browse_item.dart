import 'package:flutter/material.dart';
import 'movie_list_page.dart';

class BrowseItem extends StatelessWidget {
  final String genreName;
  final int genreId;
  final String imagePath;

  const BrowseItem({
    super.key,
    required this.genreName,
    required this.genreId,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('--------------------------------$genreId----------------------------------------' );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieListPage(
              genreId: genreId,
              genreName: genreName,

            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              height: 90,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
              ),
              child: Text(
                genreName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
