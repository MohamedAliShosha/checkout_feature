import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio _dio = Dio();

  // @required is an annotation that was used to indicate that a parameter must be provided when calling the function, even if it is nullable
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await _dio.get(
        url,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(
          'GET request failed: ${e.response?.statusCode} ${e.message}');
    }
  }

  Future<dynamic> post({
    required dynamic body,
    required String url,
    String? contentType,
    required String? token, // token is required but tha value may be null
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.post(
        url,

        data: body, // passing the body that will be sent
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': 'Bearer $token'},
        ), // options holds the headers that contains "token and content type"
      );
      return response
          .data; // response.data contains only the actual data returned from the server (usually the JSON body or result you care about).
    } on DioException catch (e) {
      throw Exception(
          'POST request failed: ${e.response?.statusCode} ${e.message}');
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    log('url = $url body = $body token = $token ');
    try {
      final response = await _dio.put(
        url,
        data: body,
        options: Options(headers: headers),
      );
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } on DioException catch (e) {
      throw Exception(
          'PUT request failed: ${e.response?.statusCode} ${e.message}');
    }
  }

  Future<dynamic> delete({
    required String url,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await _dio.delete(
        url,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(
          'DELETE request failed: ${e.response?.statusCode} ${e.message}');
    }
  }
}
