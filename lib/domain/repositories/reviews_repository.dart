import 'package:cinetrace/domain/entities/review_entity.dart';

abstract class ReviewsRepository {
  Future<List<ReviewEntity>> getAllMovieReviews(int movieId);
}