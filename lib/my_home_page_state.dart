
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Client Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Dio _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
  List<dynamic>? _todos;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  void _fetchTodos() async {
    try {
      final response = await _dio.get('todos');
      setState(() {
        _todos = response.data;
        _isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter API Client Example'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _todos == null
              ? Center(child: Text('No data'))
              : ListView.builder(
                  itemCount: _todos!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var todo = _todos![index];
                    return ListTile(
                      title: Text(todo['title']),
                      subtitle: Text('Completed: ${todo['completed']}'),
                    );
                  },
                ),
    );
  }
}
