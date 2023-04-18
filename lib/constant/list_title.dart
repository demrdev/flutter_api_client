import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({
    super.key,
    required this.todo,
  });

  final todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo['title']),
      trailing: Checkbox(
        value: todo['completed'],
        onChanged: (_) {},
      ),
      onTap: () {
        showDialog(
          context: context,
          useRootNavigator: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Todo Details'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Title: ${todo['title']}'),
                  const SizedBox(height: 10),
                  Text('Completed: ${todo['completed']}'),
                ],
              ),
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
  }
}