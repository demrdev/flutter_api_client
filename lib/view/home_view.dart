import 'package:flutter/material.dart';

import '../constant/list_title.dart';
import '../core/todo_fetcher.dart';
part 'home_string_values.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TodoFetcher todoFetcher = TodoFetcher();
  final HomeStringValues values = HomeStringValues();

  @override
  void initState() {
    super.initState();
    todoFetcher.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(values.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              values.apiResult,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            !todoFetcher.isLoading
                ? todoFetcher.todos == null
                    ? Text(values.noData)
                    : Expanded(
                        child: ListView.builder(
                          itemCount: todoFetcher.todos!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var todo = todoFetcher.todos![index];
                            return ListTitle(todo: todo);
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


