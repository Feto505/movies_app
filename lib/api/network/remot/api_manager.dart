import 'package:dio/dio.dart';
import 'package:movie/models/categories_response.dart';
import 'package:movie/models/category_screen_response.dart';
import 'package:movie/models/movie_details_response.dart';
import 'package:movie/models/movie_response.dart';
import 'package:movie/core/constants.dart';

class Constants {
  // static const String apiKey = "675604a83c2d17d1683df7f426d8c5b4";
  static const String domain = "api.themoviedb.org";
  String apikey = "e5fbe73fc58f4f997b2f7c65a8fc6863";
  String baseUrl = "https://api.themoviedb.org";
  String baseImageUrl = "https://image.tmdb.org/t/p";
  String topRatedEndPoint = "3/movie/top_rated";
  String popularEndPoint = "3/movie/popular";
  String upComingEndPoint = "3/movie/upcoming";
  String searchEndPoint = "3/search/movie";
  String categoriesEndPoint = "3/genre/movie/list";
  String categoryScreenEndPoint = "3/discover/movie";
  String STATUS = "ok";
  String AccessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNWZiZTczZmM1OGY0Zjk5N2IyZjdjNjVhOGZjNjg2MyIsInN1YiI6IjY0OThkMDM5ZWI3OWMyMDBhZDcyMDk0NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9ikkA6-c-i-MH4uwCc0MY-NUPxJqAdxhXUVApa1N8d4";

}

class ApiManager {

  static Future<MovieResponse> getPopular() async {
    final dio = Dio();
    final response = await dio.get(
      "$baseUrl/$popularEndPoint",
      queryParameters: {'api_key': apikey},
    );
    final MovieResponse popularResponse = MovieResponse.fromJson(response.data);
    return popularResponse;
  }

  static Future<MovieResponse> getUpComingMovies() async {
    final Dio dio = Dio();
    final response = await dio.get(
      '$baseUrl/$upComingEndPoint',
      queryParameters: {'api_key': apikey},
    );
    final MovieResponse upComingMovies = MovieResponse.fromJson(response.data);
    return upComingMovies;
  }

  static Future<MovieResponse> getTopRatedMovies() async {
    final Dio dio = Dio();
    final response = await dio.get(
      '$baseUrl/$topRatedEndPoint',
      queryParameters: {'api_key': apikey},
    );
    final MovieResponse topRatedMovies = MovieResponse.fromJson(response.data);
    return topRatedMovies;
  }

  static Future<MovieDetailsResponse> getMovieDetails(String movieId) async {
    final Dio dio = Dio();
    final response = await dio.get(
      '$baseUrl/3/movie/$movieId',
      queryParameters: {'api_key': apikey},
    );
    final MovieDetailsResponse detailsResponse = MovieDetailsResponse.fromJson(response.data);
    return detailsResponse;
  }

  static Future<MovieResponse> getSimilarMovies(String movieId) async {
    final Dio dio = Dio();
    final response = await dio.get(
      '$baseUrl/3/movie/$movieId/similar',
      queryParameters: {'api_key': apikey},
    );
    final MovieResponse similarResponse = MovieResponse.fromJson(response.data);
    return similarResponse;
  }


  static Future<MovieResponse> searchOnMovies(String movieName) async {
    final Dio dio = Dio();
    final response = await dio.get(
      '$baseUrl/$searchEndPoint',
      queryParameters: {'api_key': apikey,"query": movieName},
    );
    final MovieResponse searchResponse = MovieResponse.fromJson(response.data);
    return searchResponse;
  }

  static Future<CategoriesResponse> getCategoriesOfMovies() async {
    final Dio dio = Dio();
    final response = await dio.get(
      '$baseUrl/$categoriesEndPoint',
      queryParameters: {'api_key': apikey},
    );
    final CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(response.data);
    return categoriesResponse;
  }

  static Future<CategoryScreenResponse> getCategoryScreenMovies({required num genreId}) async {
    final Dio dio = Dio();
    final response = await dio.get(
      '$baseUrl/$categoryScreenEndPoint',
      queryParameters: {'api_key': apikey,'with_genres': genreId},
    );
    final CategoryScreenResponse categoryScreenResponse = CategoryScreenResponse.fromJson(response.data);
    return categoryScreenResponse;
  }
}
