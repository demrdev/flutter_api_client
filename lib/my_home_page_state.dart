import 'package:flutter/material.dart';

import 'main.dart';
import 'my_api_client.dart';

class _MyHomePageState extends State<MyHomePage> {
  final MyApiClient apiClient = MyApiClient(baseUrl: 'https://jsonplaceholder.typicode.com/');
  String? _result;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void _fetchData() async {
    changeLoading();
    try {
      final data = await apiClient.fetchData('todos');
      setState(() {
        _result = data.toString();
      });
    } catch (e) {
      setState(() {
        _result = 'Error: $e';
      });
    }
    changeLoading();
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
            !isLoading
                ? SingleChildScrollView(
                    child: Text(
                      _result!,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
