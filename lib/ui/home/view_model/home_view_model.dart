import 'dart:async';

import 'package:cinetrace/data/repositories/movie_repository_impl.dart';
import 'package:cinetrace/domain/entities/movie_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelAsyncProvider = AsyncNotifierProvider<HomeViewModel, List<MovieEntity>>(() {
  return HomeViewModel();
});

class HomeViewModel extends AsyncNotifier<List<MovieEntity>> {
  @override
  FutureOr<List<MovieEntity>> build() {
    return getPopularMovies();
  }

  Future<List<MovieEntity>> getPopularMovies() async {
    final repository = ref.read(movieRepositoryProvider);
    return await repository.getPopularMovies();
  }
}