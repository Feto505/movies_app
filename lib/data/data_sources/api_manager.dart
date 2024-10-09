import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movie/data/models/popular.dart';
import 'package:movie/data/models/similar.dart';
import 'package:movie/data/models/topRated.dart';
import 'package:movie/data/models/upcoming.dart';

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
    print(response.body);
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      //Parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      Upcoming upComing = Upcoming.fromJson(data);

      return upComing.results ?? [];
    } else {
      print('-------------------------------------');
      throw Exception("Failed to get source list");
    }
  }

  static Future<List<ResultsTopRated>> fetchTopRatedMoviesList() async {
    // 'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1'
    var url = Uri.https(
      Constants.domain,
      "/3/movie/top_rated",
      {
        // "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NzU2MDRhODNjMmQxN2QxNjgzZGY3
        // ZjQyNmQ4YzViNCIsIm5iZiI6MTcyODEyODk3MS44OTgxNTEsInN1YiI6IjY3MDEwNGYyNzgzMGMxMzAxZTdjZjZiYiI
        // sInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.yeOkmUTbJyzUGLBO2hfD1nfywskLfzxbsh4ZPuqUhxA",
        // "category": categoryId,
        "api_key": Constants.apiKey,
        "language": "en-US",
        "page": "1",
      },
    );
    final response = await http.get(url);
    print(response.body);
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      //Parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      TopRated topRated = TopRated.fromJson(data);

      return topRated.results ?? [];
    } else {
      print('-------------------------------------');
      throw Exception("Failed to get source list");
    }
  }

  static Future<List<ResultsPopular>> fetchPopularMoviesList() async {
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
    print(response.body);
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      //Parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      Popular popular = Popular.fromJson(data);

      return popular.results ?? [];
    } else {
      print('-------------------------------------');
      throw Exception("Failed to get source list");
    }
  }

  static Future<List<ResultsSimilar>> fetchSimilarMoviesList(int? id) async {
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
    print(response.body);
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      //Parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      Similar similar = Similar.fromJson(data);

      return similar.results ?? [];
    } else {
      print('-------------------------------------');
      throw Exception("Failed to get source list");
    }
  }

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
