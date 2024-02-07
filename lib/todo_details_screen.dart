import 'package:flutter/material.dart';
import 'package:the_todo_app/todo.dart';

// // Speichert seinen eigenen State, dh. kommuniziert nicht nach "außen".
// class TodoDetailsScreen extends StatefulWidget {
//   const TodoDetailsScreen({super.key, required this.todo});

//   final Todo todo;

//   @override
//   State<TodoDetailsScreen> createState() => _TodoDetailsScreenState();
// }

class TodoDetailsScreen extends StatelessWidget {
//class _TodoDetailsScreenState extends State<TodoDetailsScreen> {
  const TodoDetailsScreen(
      {super.key, required this.todo, required this.onDetailStateChanged});

  final Todo todo;
  final void Function(int, bool) onDetailStateChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.topic),
      ), // AppBar
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 48), // SizedBox
            Text(
              "ID: ${todo.id}",
              style: const TextStyle(fontSize: 32),
            ), // Text
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
                      onDetailStateChanged(todo.id, change ?? false);
                    }),
              ],
            ),
          ], // <Widget>[]
        ),
      ), // Padding
    ); // Scaffold
  }
}
