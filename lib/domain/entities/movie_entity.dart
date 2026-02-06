class MovieEntity {
  final int id;
  final String title;
  final String overview;
  final DateTime releaseDate;
  final bool adult;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.adult,
  });
}