import 'package:cinetrace/domain/entities/review_entity.dart';

class ReviewModel {
  final int id;
  final int movieId;
  final String author;
  final String content;
  final int stars;

  const ReviewModel({
    required this.id,
    required this.movieId,
    required this.author,
    required this.content,
    required this.stars,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'movieId': movieId,
      'author': author,
      'content': content,
      'stars': stars,
    };
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] as int,
      movieId: json['movieId'] as int,
      author: json['author'] as String? ?? 'Anonymous',
      content: json['content'] as String,
      stars: json['stars'] as int? ?? 0,
    );
  }

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      id: reviewEntity.id, 
      movieId: reviewEntity.movieId, 
      author: reviewEntity.author, 
      content: reviewEntity.content, 
      stars: reviewEntity.stars
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id, 
      movieId: movieId, 
      author: author, 
      content: content, 
      stars: stars
    );
  }
}