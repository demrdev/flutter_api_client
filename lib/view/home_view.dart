import 'package:flutter/material.dart';

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
              style: Theme.of(context).textTheme.headline6,
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
                            return ListTile(
                              title: Text(todo['title']),
                              trailing: Checkbox(
                                value: todo['completed'],
                                onChanged: (_) {},
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Todo Details'),
                                      content: Text('Title: ${todo['title']}\nCompleted: ${todo['completed']}'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
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
