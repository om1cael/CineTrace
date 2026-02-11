import 'dart:convert';

import 'package:cinetrace/data/models/review_model.dart';
import 'package:cinetrace/data/services/api_service.dart';
import 'package:cinetrace/domain/entities/review_entity.dart';
import 'package:cinetrace/domain/repositories/reviews_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewsRepositoryProvider = Provider((ref) {
  return ReviewsRepositoryImpl(apiService: ref.watch(apiServiceProvider));
});

class ReviewsRepositoryImpl implements ReviewsRepository {
  final ApiService _apiService;
  
  const ReviewsRepositoryImpl({
    required ApiService apiService,
  }) : _apiService = apiService;

  @override
  Future<ReviewEntity> createReview(int movieId, ReviewEntity review) async {
    final reviewModel = ReviewModel.fromEntity(review);
    final reviewJson = jsonEncode(reviewModel);

    final reviewResponse = await _apiService.createReview(movieId, reviewJson);
    return ReviewModel
      .fromJson(reviewResponse)
      .toEntity();
  }

  @override
  Future<List<ReviewEntity>> getAllMovieReviews(int movieId) async {
    final reviewList = await _apiService.getAllMovieReviews(movieId);

    return reviewList.map((json) {
      return ReviewModel.fromJson(json).toEntity();
    }).toList();
  }
}