import 'package:dio/dio.dart';

class DioClient {
  static DioClient? _instance;

  static DioClient get instance {
    _instance ??= DioClient._init();
    return _instance!;
  }

  late final Dio dio;

  DioClient._init() : dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  void dispose() {
    dio.close();
  }
}
