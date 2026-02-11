import 'dart:async';

import 'package:cinetrace/data/repositories/movie_repository_impl.dart';
import 'package:cinetrace/domain/entities/movie_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieViewModelProvider = 
  AsyncNotifierProvider.autoDispose.family<MovieViewModel, MovieEntity, int>(MovieViewModel.new);

class MovieViewModel extends AsyncNotifier<MovieEntity> {
  MovieViewModel(this.movieId);
  final int movieId;

  @override
  FutureOr<MovieEntity> build() {
    return getMovieById(movieId);
  }

  Future<MovieEntity> getMovieById(int id) async {
    return await ref.read(movieRepositoryProvider).getMovieById(id);
  }
}