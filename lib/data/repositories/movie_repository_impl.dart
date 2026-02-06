import 'package:cinetrace/data/models/movie_model.dart';
import 'package:cinetrace/data/services/api_service.dart';
import 'package:cinetrace/domain/entities/movie_entity.dart';
import 'package:cinetrace/domain/repositories/movie_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(apiService: ref.read(apiServiceProvider));
});

class MovieRepositoryImpl implements MovieRepository {
  final ApiService _apiService;
  
  const MovieRepositoryImpl({
    required ApiService apiService,
  }) : _apiService = apiService;

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    final movieList = await _apiService.fetchPopularMovies();
    return movieList
      .map((json) {
        final model = MovieModel.fromJson(json);
        return model.toEntity();
      }).toList();
  }
}