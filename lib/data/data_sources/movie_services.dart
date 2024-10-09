import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie.dart';

Future<Movies> fetchMoviesByGenre(int genreId) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/discover/movie?api_key=675604a83c2d17d1683df7f426d8c5b4&with_genres=$genreId'));

  if (response.statusCode == 200) {
    return Movies.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load movies');
  }
}

// Example usage:
void loadMovies() async {
  Movies movies = await fetchMoviesByGenre(28);
  movies.results?.forEach((result) {
    print(result.title);
  });
}
