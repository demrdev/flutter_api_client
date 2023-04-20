import 'package:flutter/material.dart';

import '../constant/list_title.dart';
import '../core/todo_fetcher.dart';
part 'home_string_values.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TodoFetcher _todoFetcher;
  final HomeStringValues _values = HomeStringValues();

  @override
  void initState() {
    super.initState();
    _todoFetcher = TodoFetcher();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _todoFetcher.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_values.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _values.apiResult,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            StreamBuilder<bool>(
              stream: _todoFetcher.isLoadingStream,
              initialData: false,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData || snapshot.data == true) {
                  return const CircularProgressIndicator();
                }
                if (_todoFetcher.todos == null) {
                  return Text(_values.noData);
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: _todoFetcher.todos!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var todo = _todoFetcher.todos![index];
                      return ListTitle(todo: todo);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
