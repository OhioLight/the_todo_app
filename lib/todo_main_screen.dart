import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/done_todos_screen.dart';
import 'package:the_todo_app/open_todos_screen.dart';
import 'package:the_todo_app/todo_item.dart';
import 'package:the_todo_app/todo_provider.dart';

class TodoMainScreen extends StatelessWidget {
  const TodoMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Schritt 3: Den Provider verwenden.
    //final provider = context.watch<TodoProvider>();
    final provider = Provider.of<TodoProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo App",
          style: TextStyle(fontSize: 32),
        ), // Text
        backgroundColor: Colors.lightBlue[500],
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const OpenTodosScreen(),
              ));
            },
            child: Row(
              children: [
                const Icon(Icons.pending_actions),
                Text(
                  provider.openTodos.length.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DoneTodosScreen(),
              ));
            },
            child: Row(
              children: [
                const Icon(Icons.done),
                Text(
                  provider.doneTodos.length.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      ), // AppBar
      body: ListView.builder(
        itemCount: provider.todos.length,
        itemBuilder: (context, index) {
          return TodoItem(todo: provider.todos[index]);
        },
      ), // Container
    );
  }
}
