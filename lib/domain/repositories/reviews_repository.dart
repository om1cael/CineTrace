import 'package:cinetrace/domain/entities/review_entity.dart';

abstract class ReviewsRepository {
  Future<ReviewEntity> createReview(int movieId, ReviewEntity review);
  Future<List<ReviewEntity>> getAllMovieReviews(int movieId);
}