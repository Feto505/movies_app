import 'package:flutter/material.dart';

import 'browse_item.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  final List<Map<String, dynamic>> genres = const [
    {'name': 'Action', 'id': 28, 'image': 'assets/images/action.png'},
    {'name': 'Adventure', 'id': 12, 'image': 'assets/images/adventure.png'},
    {'name': 'Comedy', 'id': 35, 'image': 'assets/images/comedy.png'},
    {'name': 'Drama', 'id': 18, 'image': 'assets/images/drama.png'},
    {'name': 'Fantasy', 'id': 14, 'image': 'assets/images/fantasy.png'},
    {'name': 'Horror', 'id': 27, 'image': 'assets/images/horror.png'},
    {'name': 'Romance', 'id': 10749, 'image': 'assets/images/romance.png'},
    {'name': 'Sci-Fi', 'id': 878, 'image': 'assets/images/scifi.png'},
    {'name': 'Thriller', 'id': 53, 'image': 'assets/images/thriller.png'},
    {'name': 'Animation', 'id': 16, 'image': 'assets/images/animation.png'},
    {'name': 'Documentary', 'id': 99, 'image': 'assets/images/documentary.png'},
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Browse Category", style: theme.textTheme.titleLarge),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
          ),
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return BrowseItem(
              genreName: genres[index]['name']!,
              genreId: genres[index]['id']!,
              imagePath: genres[index]['image']!,
            );
          },
        ),
      ),
    );
  }
}
