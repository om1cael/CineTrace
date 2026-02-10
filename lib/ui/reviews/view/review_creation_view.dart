import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReviewCreationView extends StatelessWidget {
  const ReviewCreationView({super.key, required this.movieId});
  final String? movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creating review for MOVIE"),
        leading: IconButton(
          onPressed: () => goBack(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: const Placeholder(),
    );
  }

  void goBack(BuildContext context) {
    if(context.canPop()) {
      return context.pop();
    }

    context.go('/');
  }
}