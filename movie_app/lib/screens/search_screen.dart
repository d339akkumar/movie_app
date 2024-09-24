import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/movie_model.dart';
import '../widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ApiService apiService = ApiService();
  List<Movie> searchResults = [];
  String query = '';

  void searchMovies(String query) async {
    final results = await apiService.searchMovies(query);
    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background for search screen
      appBar: AppBar(
        backgroundColor: Colors.black, // Black AppBar background
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for movies...',
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.6)), // White hint text
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white), // White text input
          onSubmitted: (query) {
            searchMovies(query);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: searchResults[index]);
        },
      ),
    );
  }
}
