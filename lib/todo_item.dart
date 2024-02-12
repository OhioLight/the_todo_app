import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/todo.dart';
import 'package:the_todo_app/todo_details_screen.dart';
import 'package:the_todo_app/todo_provider.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoDetailsScreen(
              todo: todo,
            ),
          ),
        );
      },
      child: Consumer<TodoProvider>(
        builder: (context, provider, child) => ListTile(
          leading: Checkbox(
            value: todo.isDone,
            onChanged: (bool? value) {
              provider.toggleTodo(todo);
            },
          ),
          title: Text(todo.topic),
        ),
      ),
    );
  }
}
