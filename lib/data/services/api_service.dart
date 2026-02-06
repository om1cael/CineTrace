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

  Future<List<dynamic>> fetchPopularMovies() async {
    final response = await _dio.get('/movies/popular');
    return response.data;
  }
}