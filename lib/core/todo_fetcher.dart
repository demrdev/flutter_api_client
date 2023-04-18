import 'package:dio/dio.dart';

class TodoFetcher {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
  List<dynamic>? todos;
  bool isLoading = false;

  Future<void> fetchTodos() async {
    try {
      final response = await _dio.get('todos');
      todos = response.data;
      changeLoading();
    } catch (e) {
      print('Error: $e');
    }
    changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }
}
