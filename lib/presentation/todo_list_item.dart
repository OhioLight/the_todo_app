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
      child: Consumer<TodoModel>(
        builder: (context, todosModel, child) => ListTile(
          leading: Checkbox(
            value: todo.isDone,
            onChanged: (bool? value) {
              todosModel.toggleTodo(todo);
            },
          ),
          title: Text(todo.topic),
        ),
      ),
    );
  }
}
