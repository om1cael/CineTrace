class ReviewEntity {
  final int id;
  final int movieId;
  final String author;
  final String content;
  final int stars;

  const ReviewEntity({
    required this.id,
    required this.movieId,
    required this.author,
    required this.content,
    required this.stars,
  });
}