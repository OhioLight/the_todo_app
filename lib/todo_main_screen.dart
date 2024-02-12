import 'package:flutter/material.dart';
import 'package:the_todo_app/todo.dart';
import 'package:the_todo_app/todo_item.dart';

class TodoMainScreen extends StatelessWidget {
  const TodoMainScreen({
    super.key,
    required this.openTodos,
    required this.doneTodos,
    required this.todos,
  });

  final List<Todo> openTodos;
  final List<Todo> doneTodos;
  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo App",
          style: TextStyle(fontSize: 32),
        ),
        backgroundColor: Colors.lightBlue[500],
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(Icons.pending_actions),
                Text(
                  openTodos.length.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(Icons.done),
                Text(
                  doneTodos.length.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoItem(todo: todos[index]);
        },
      ),
    );
  }
}
