// import 'package:tmdb_movie_app/config/api_service_url.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class TrendMovieRepository {
//   Future<Map<String, dynamic>> getTrendingMovie() async {
//     final url = Uri.parse(ApiServiceUrls.trendingUrl);
//     try {
//       final resp = await http.get(url);
//       if (resp.statusCode == 200) {
//         Map<String, dynamic> trendMovieList = jsonDecode(resp.body);
//         return trendMovieList;
//         print('Trending Movies Data: $trendMovieList');
//       } else {
//         print('Failed to load data');
//         return {};
//       }
//     } catch (e) {
//       print('Exception ${e}');
//       return {};
//     }
//   }
// }
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../config/api_service_url.dart';
//
// class MovieService {
//   static Future<Map<String, dynamic>> fetchMovies() async {
//     final response = await http.get(Uri.parse(
//       '${ApiConfig.baseUrl}/movie/popular?api_key=${ApiConfig.apiKey}',
//     ));
//     if (response.statusCode == 200) {
//       // final data = json.decode(response.body);
//       Map<String, dynamic> results = json.decode(response.body);
//       print(results);
//       //final List<dynamic> results = data['results'];
//       //return results.map((json) => Movie.fromJson(json)).toList();
//       return results;
//     } else {
//       throw Exception('Failed to fetch movies');
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/api_service_url.dart';
import '../model/trending_movie_model.dart';

class MovieRepository {
  static Future<List<Movie>> fetchTopRated() async {
    var response;
    try {
      response = await http.get(
        Uri.parse(
            '${ApiConfig.baseUrl}/movie/top_rated?api_key=${ApiConfig.apiKey}'),
      );
    } catch (e) {
      print('Api Error $e');
    }
    https: //api.themoviedb.org/3/movie/popular?api_key=f9f4783f569fcd1104aaf0a401c35778

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      print(data);
      return data.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<List<Movie>> fetchPopularMovies() async {
    var response;
    try {
      response = await http.get(
        Uri.parse(
            '${ApiConfig.baseUrl}/movie/popular?api_key=${ApiConfig.apiKey}'),
      );
    } catch (e) {
      print('Api Error $e');
    }
    https: //api.themoviedb.org/3/movie/popular?api_key=f9f4783f569fcd1104aaf0a401c35778

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      print(data);
      return data.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<List<Movie>> fetchUpcomingMovies() async {
    var response;
    try {
      response = await http.get(
        Uri.parse(
            '${ApiConfig.baseUrl}/movie/upcoming?api_key=${ApiConfig.apiKey}'),
      );
    } catch (e) {
      print('Api Error $e');
    }
    https: //api.themoviedb.org/3/movie/popular?api_key=f9f4783f569fcd1104aaf0a401c35778

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      print(data);
      return data.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<List<Movie>> fetchNowPlayingMovies() async {
    var response;
    try {
      response = await http.get(
        Uri.parse(
            '${ApiConfig.baseUrl}/movie/now_playing?api_key=${ApiConfig.apiKey}'),
      );
    } catch (e) {
      print('Api Error $e');
    }
    https: //api.themoviedb.org/3/movie/popular?api_key=f9f4783f569fcd1104aaf0a401c35778

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      print(data);
      return data.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
