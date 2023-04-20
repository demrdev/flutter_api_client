import 'package:dio/dio.dart';
import '../constant/app_constant.dart';

class DioClient {
  static DioClient? _instance;

  static DioClient get instance {
    _instance ??= DioClient._init();
    return _instance!;
  }

  late final Dio dio;

  DioClient._init() : dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));

  void dispose() {
    dio.close();
  }
}
