import 'package:cinetrace/domain/entities/review_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider((ref) {
  return ApiService(); 
});

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.0.109:8080/api/v1/',
    connectTimeout: Duration(seconds: 5),
  ));

  Future<dynamic> createReview(int movieId, String reviewJson) async {
    print(reviewJson);
    final response = await _dio.post(
      '/reviews/$movieId',
      data: reviewJson,
      options: Options(
        contentType: 'application/json'
      )
    );

    return response.data;
  }

  Future<List<dynamic>> fetchPopularMovies() async {
    final response = await _dio.get('/movies/popular');
    return response.data;
  }

  Future<dynamic> getMovieById(int id) async {
    final response = await _dio.get('/movies/$id');
    return response.data;
  }

  Future<List<dynamic>> getAllMovieReviews(int movieId) async {
    final response = await _dio.get('/reviews/$movieId');
    return response.data;
  }
}