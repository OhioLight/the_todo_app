import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/domain/todo.dart';
import 'package:the_todo_app/presentation/todo_details_screen.dart';
import 'package:the_todo_app/presentation/todo_model.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, model, child) => ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (bool? value) {
            model.toggleTodo(todo);
          },
        ),
        title: Text(todo.topic),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            model.deleteTodo(todo);
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoDetailsScreen(todo: todo),
            ),
          );
        },
      ),
    );
  }
}
