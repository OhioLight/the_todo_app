import 'package:flutter/material.dart';
import 'package:the_todo_app/todo.dart';
import 'package:the_todo_app/todo_item.dart';

class TodoMainScreen extends StatelessWidget {
  const TodoMainScreen({
    super.key,
    required this.openTodos,
    required this.doneTodos,
    required this.todos,
    required this.onChangeCallback,
  });

  final List<Todo> openTodos;
  final List<Todo> doneTodos;
  final List<Todo> todos;
  final Function(int, bool) onChangeCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo App",
          style: TextStyle(fontSize: 32),
        ), // Text
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
      ), // AppBar
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoItem(
            todo: todos[index],
            onItemStateChanged: (id, newState) =>
                onChangeCallback(id, newState),
          );
        },
      ), // Container
    );
  }
}
