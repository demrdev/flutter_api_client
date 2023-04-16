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
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'API Result:',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 10),
            !_isLoading
                ? _todos == null
                    ? Text('No data')
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _todos!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var todo = _todos![index];
                            return Card(
                              elevation: 5,
                              margin: const EdgeInsets.all(8),
                              child: ListTile(
                                title: Text(todo['title']),
                                subtitle: Text('Completed: ${todo['completed']}'),
                              ),
                            );
                          },
                        ),
                      )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
