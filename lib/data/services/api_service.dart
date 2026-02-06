import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: '192.168.0.109:8080/api/v1/',
    connectTimeout: Duration(seconds: 5),
  ));

  Future<List<dynamic>> fetchPopularMovies() async {
    final response = await _dio.get('/movies/popular');
    return response.data;
  }
}