import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import 'package:get/get.dart';
import '../screens/details_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black, // Card background black to match app theme
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: InkWell(
        onTap: () {
          // Navigate to the details screen on tap
          Get.to(DetailsScreen(movie: movie));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Movie Poster Image (Full width as thumbnail)
            Image.network(
              movie.imageUrl,
              width: double.infinity, // Stretches image full width
              height: 250, // Set height for landscape image
              fit: BoxFit.cover, // Ensures the image covers full space
            ),
            SizedBox(height: 8), // Spacing below image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Movie Title (bold and white)
                  Text(
                    movie.name,
                    style: TextStyle(
                      color: Colors.white, // White text color for title
                      fontWeight: FontWeight.bold, // Bold title text
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8), // Spacing between title and summary
                  // 3. Movie Summary (White color)
                  Text(
                    movie.summary.replaceAll(
                        RegExp(r'<[^>]*>'), ''), // Strip HTML tags from summary
                    style: TextStyle(
                      color: Colors.white, // White color for summary text
                      fontSize: 14.0,
                    ),
                    maxLines: 4, // Limit summary to 4 lines
                    overflow:
                        TextOverflow.ellipsis, // Ellipsis for overflowed text
                  ),
                ],
              ),
            ),
            SizedBox(height: 12), // Padding at the bottom
          ],
        ),
      ),
    );
  }
}
