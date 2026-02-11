import 'dart:async';

import 'package:cinetrace/data/repositories/reviews_repository_impl.dart';
import 'package:cinetrace/domain/entities/review_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewViewModelProvider = 
  AsyncNotifierProvider.autoDispose.family<ReviewViewModel, List<ReviewEntity>, int>(ReviewViewModel.new);

class ReviewViewModel extends AsyncNotifier<List<ReviewEntity>> {
  ReviewViewModel(this.movieId);
  final int movieId;

  @override
  FutureOr<List<ReviewEntity>> build() {
    return getAllMovieReviews();
  }

  Future<ReviewEntity> createReview(int movieId, String content, int stars) async {
    final review = ReviewEntity(
      id: 0,
      movieId: movieId,
      author: 'Test',
      content: content,
      stars: stars
    );

    return await ref.read(reviewsRepositoryProvider).createReview(movieId, review);
  }

  Future<List<ReviewEntity>> getAllMovieReviews() async {
    return await ref.read(reviewsRepositoryProvider).getAllMovieReviews(movieId);
  }

  String? validateReview(String? value, String minimumCharactersText) {
    if(value == null || value.isEmpty || value.length < 10) return minimumCharactersText;
    return null;
  }
}