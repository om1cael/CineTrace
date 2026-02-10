import 'package:flutter/material.dart';

class ReviewCreationView extends StatelessWidget {
  const ReviewCreationView({super.key, required this.movieId});
  final String? movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creating review for MOVIE"),
      ),
      body: const Placeholder(),
    );
  }
}