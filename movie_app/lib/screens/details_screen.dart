import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background for details screen
      appBar: AppBar(
        backgroundColor: Colors.white, // White header background
        title: Text(
          movie.name,
          style: TextStyle(
            color: Colors.black, // Black text for title in header
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster (Full width)
            Image.network(
              movie.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0), // Spacing below poster image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie Title (White)
                  Text(
                    movie.name,
                    style: TextStyle(
                      color: Colors.white, // White text color for title
                      fontWeight: FontWeight.bold, // Bold title
                      fontSize: 24.0, // Larger font size for title
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Movie Summary (White)
                  Text(
                    movie.summary
                        .replaceAll(RegExp(r'<[^>]*>'), ''), // Strip HTML tags
                    style: TextStyle(
                      color: Colors.white, // White text for summary
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
