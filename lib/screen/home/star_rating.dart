import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating; // The rating value (out of 10)
  final int starCount;
  final double size; // Total number of stars to display

  StarRating({required this.rating, this.starCount = 5, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    // Calculate the number of filled stars based on the rating
    int filledStars = (rating / 2).round(); // Assuming the rating is out of 10

    return Row(
      children: List.generate(starCount, (index) {
        return Icon(
          index < filledStars ? Icons.star : Icons.star_border,
          color: Colors.yellow,
          size: size,
        );
      }),
    );
  }
}
