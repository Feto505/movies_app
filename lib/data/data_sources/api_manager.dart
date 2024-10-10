import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/data/models/movies_model.dart';

import '../../core/constants.dart';

class ApiManager {
  // final String baseUrl="api.themoviedb.org";
  // final String baseUrlImg="image.tmdb.org";
  static Future<List<Results>> fetchUpcomingMoviesList() async {
    // 'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1'
    var url = Uri.https(
      Constants.domain,
      "/3/movie/upcoming",
      {
        // "category": categoryId,
        "api_key": Constants.apiKey,
        "language": "en-US",
        "page": "1",
      },
    );
    final response = await http.get(url);
    // print(response.body);
    // log(response.body);
    // log(response.statusCode.toString());
    if (response.statusCode == 200) {
      //Parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      MoviesModels upComing = MoviesModels.fromJson(data);

      return upComing.results ?? [];
    } else {
      print('-------------------------------------');
      throw Exception("Failed to get source list");
    }
  }

  static Future<List<Results>> fetchTopRatedMoviesList() async {
    // 'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1'
    var url = Uri.https(
      Constants.domain,
      "/3/movie/top_rated",
      {
        "api_key": Constants.apiKey,
        "language": "en-US",
        "page": "1",
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //Parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      MoviesModels topRated = MoviesModels.fromJson(data);

      return topRated.results ?? [];
    } else {
      print('-------------------------------------');
      throw Exception("Failed to get source list");
    }
  }

  static Future<List<Results>> fetchPopularMoviesList() async {
    // 'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1'
    var url = Uri.https(
      Constants.domain,
      "/3/movie/popular",
      {
        "api_key": Constants.apiKey,
        "language": "en-US",
        "page": "1",
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //Parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      MoviesModels popular = MoviesModels.fromJson(data);

      return popular.results ?? [];
    } else {
      print('-------------------------------------');
      throw Exception("Failed to get source list");
    }
  }

  static Future<List<Results>> fetchSimilarMoviesList(int? id) async {
    // 'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1'
    var url = Uri.https(
      Constants.domain,
      "/3/movie/$id/similar",
      {
        "api_key": Constants.apiKey,
        "language": "en-US",
        "page": "1",
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //Parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      MoviesModels similar = MoviesModels.fromJson(data);

      return similar.results ?? [];
    } else {
      print('-------------------------------------');
      throw Exception("Failed to get source list");
    }
  }

//   Future<Movies> fetchMoviesByGenre(int genreId) async {
//     final response = await http.get(Uri.parse(
//         'https://api.themoviedb.org/3/discover/movie?api_key=675604a83c2d17d1683df7f426d8c5b4&with_genres=$genreId'));
//
//     if (response.statusCode == 200) {
//       return Movies.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load movies');
//     }
//   }
//
// // Example usage:
//   void loadMovies() async {
//     Movies movies = await fetchMoviesByGenre(28);
//     movies.results?.forEach((result) {
//       print(result.title);
//     });
//   }

  /// =======================================================
// static Future<List<Article>> fetchArticlesList({String? sourceId,String? q}) async{
//   // GET https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
//   var url = Uri.https(
//     Constants.domain,
//     "/v2/top-headlines",
//     {
//       if (sourceId !=null) "sources":sourceId ?? '',
//       if (q != null) 'q':q,
//       "apiKey": Constants.apiKey,
//
//     },
//   );
//   final response = await http.get(url);
//   if(response.statusCode == 200){
//     //Parsing
//     Map<String, dynamic> data = jsonDecode(response.body);
//     ArticlesModel articlesModel = ArticlesModel.fromJson(data);
//     return articlesModel.articles;
//
//   }else{
//     throw Exception("Failed to get source list");
//   }
// }
}
