import 'dio_client.dart';

class TodoFetcher {
  final DioClient _dioClient = DioClient();
  List<dynamic>? todos;
  bool isLoading = false;

  Future<void> fetchTodos() async {
    try {
      final response = await _dioClient.dio.get('todos');
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
  
  List<dynamic>? getTodos() {
    return todos;
  }
}
