import 'package:cinetrace/domain/entities/movie_entity.dart';

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final DateTime releaseDate;
  final bool adult;

  const MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.adult,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'], 
      title: json['title'], 
      overview: json['overview'], 
      releaseDate: DateTime.parse(json['release_date']), 
      adult: json['adult'],
    );
  }

  MovieEntity toEntity() {
    return MovieEntity(
      id: id, 
      title: title, 
      overview: overview, 
      releaseDate: releaseDate, 
      adult: adult
    );
  }
}