import 'dart:async';
import 'dio_client.dart';

class TodoFetcher {
  final DioClient _dioClient;

  TodoFetcher(this._dioClient);

  late final List<dynamic>? todos;
  final StreamController<bool> _isLoadingController = StreamController<bool>.broadcast();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  Future<void> fetchTodos() async {
    _isLoadingController.add(true);
    try {
      final response = await _dioClient.dio.get('todos');
      todos = response.data;
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoadingController.add(false);
    }
  }

  List<dynamic>? getTodos() {
    return todos;
  }

  void dispose() {
    _isLoadingController.close();
  }
}
