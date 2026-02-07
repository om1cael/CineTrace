import 'package:cinetrace/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getPopularMovies();
  Future<MovieEntity> getMovieById(int id);
}