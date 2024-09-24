import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie_model.dart';

class ApiService {
  static const String apiUrl = 'https://api.tvmaze.com/search/shows?q=';

  // Fetch all movies
  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(apiUrl + 'all'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((movieData) => Movie.fromJson(movieData)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  // Search for a specific movie
  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(Uri.parse(apiUrl + query));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((movieData) => Movie.fromJson(movieData)).toList();
    } else {
      throw Exception('Failed to search movies');
    }
  }
}
