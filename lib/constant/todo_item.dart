import 'package:flutter/material.dart';

import '../view/home_view.dart';



class TodoItem extends StatelessWidget {
  final String title;
  final bool completed;
  final HomeStringValues values = HomeStringValues();

  TodoItem({super.key, required this.title, required this.completed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(title),
        subtitle: Text('${values.completed}$completed'),
      ),
    );
  }
}

