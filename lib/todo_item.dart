import 'package:flutter/material.dart';
import 'package:the_todo_app/todo.dart';
import 'package:the_todo_app/todo_details_screen.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
    required this.onItemStateChanged,
  });

  final Todo todo;
  final void Function(int, bool) onItemStateChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoDetailsScreen(
              todo: todo,
              onDetailStateChanged: onItemStateChanged,
            ),
          ),
        );
      },
      child: ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (bool? value) {
            onItemStateChanged(todo.id, value ?? false);
          },
        ),
        title: Text(todo.topic),
      ),
    );
  }
}
