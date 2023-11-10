import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widgets/constants.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${constants.api_key}';

  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${constants.api_key}';

  static const _UpcommingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${constants.api_key}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      // print(decodedData);
      return decodedData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception("Something wrong");
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      // print(decodedData);
      return decodedData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception("Something wrong");
    }
  }

  Future<List<Movie>> getUpcommingMovies() async {
    final response = await http.get(Uri.parse(_UpcommingUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      // print(decodedData);
      return decodedData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception("Something wrong");
    }
  }
}
