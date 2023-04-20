import 'dart:async';

import 'dio_client.dart';

class TodoFetcher {
  static final TodoFetcher _instance = TodoFetcher._internal();

  factory TodoFetcher() {
    return _instance;
  }

  TodoFetcher._internal() {
    _dioClient = DioClient.instance;
  }

  late DioClient _dioClient;
  List<dynamic>? todos;
  StreamController<bool> _isLoadingController = StreamController<bool>.broadcast();

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
