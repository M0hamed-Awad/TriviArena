import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiHelper {
  final Dio dio = Dio();

  Future<dynamic> get({
    required String url,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Map<String, String> headers = {};

      if (token != null) {
        headers.addAll({"Authorization": "Bearer $token"});
      }

      Response response = await dio.get(
        url,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );

      debugPrint(
        "Response: ${response.data["question"]}\nStatus Code: ${response.statusCode}",
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed with status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      debugPrint("Dio error: $e");
      throw Exception(e.response?.data["message"] ?? "Network Error");
    }
  }
}
