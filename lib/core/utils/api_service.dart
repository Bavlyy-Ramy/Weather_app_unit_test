import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl;

  ApiService(this._dio, {required this.baseUrl});

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.get(
      '$baseUrl$endPoint',
      queryParameters: queryParams,
    );
    return response.data;
  }
}
