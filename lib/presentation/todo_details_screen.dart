import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/domain/todo.dart';
import 'package:the_todo_app/presentation/todo_model.dart';

class TodoDetailsScreen extends StatelessWidget {
  const TodoDetailsScreen({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final TodoModel todoModel = context.watch<TodoModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.topic),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            Text(
              "ID: ${todo.id}",
              style: const TextStyle(fontSize: 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Erledigt?",
                  style: TextStyle(fontSize: 24),
                ),
                Checkbox(
                    value: todo.isDone,
                    onChanged: (change) {
                      todoModel.toggleTodo(todo);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
