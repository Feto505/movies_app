import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/core/config/page_routes_name.dart';

class MovieListPage extends StatefulWidget {
  final int genreId;
  final String genreName;

  const MovieListPage({
    Key? key,
    required this.genreId,
    required this.genreName,
  }) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final apiKey = '675604a83c2d17d1683df7f426d8c5b4';
    final url =
        'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=${widget.genreId}';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          movies = data['results'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.genreName} Movies"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: movies[index]['poster_path'] != null
                      ? Image.network(
                          'https://image.tmdb.org/t/p/w200${movies[index]['poster_path']}',
                          fit: BoxFit.cover,
                        )
                      : const SizedBox(),
                  title: Text(
                    movies[index]['title'],
                    style: theme.textTheme.bodyMedium!,
                  ),
                  subtitle: Text(movies[index]['release_date'] ?? 'Unknown'),
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutesName.releaseDetails,
                        arguments: movies);
                  },
                );
              },
            ),
    );
  }
}
