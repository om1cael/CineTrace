import 'package:flutter/material.dart';

class MovieView extends StatelessWidget {
  const MovieView({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Placeholder(),
    );
  }
}