import 'dart:convert';

import 'package:dio/dio.dart';

class ApiClient {
  static const String _baseUrl = 'https://api.example.com';

  final Dio _dio;

  ApiClient()
      : _dio = Dio(BaseOptions(
          baseUrl: _baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer YOUR_TOKEN_HERE',
          },
        ));

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return _request('get', path, queryParameters: queryParameters);
  }

  Future<dynamic> post(String path, dynamic data) async {
    return _request('post', path, data: data);
  }

  Future<dynamic> put(String path, dynamic data) async {
    return _request('put', path, data: data);
  }

  Future<dynamic> delete(String path) async {
    return _request('delete', path);
  }

  Future<dynamic> _request(
    String method,
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.request(
        path,
        options: Options(
          method: method,
        ),
        queryParameters: queryParameters,
        data: data != null ? jsonEncode(data) : null,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      } else {
        throw Exception(
            'API request failed with status code ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('API request failed: $error');
    }
  }

  void close() {
    _dio.close();
  }
}
