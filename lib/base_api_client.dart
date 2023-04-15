import 'package:dio/dio.dart';

abstract class BaseApiClient {
  late final Dio dio;

  BaseApiClient(String baseUrl) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
      ),
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await dio.get(
        path,
        queryParameters: queryParameters,
      );
    } on DioError catch (e) {
      throw Exception('Failed to perform GET request: ${e.message}');
    }
  }

  
}
