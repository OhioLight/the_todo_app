import 'package:flutter/material.dart';
import 'package:the_todo_app/todo.dart';

// Speichert seinen eigenen State, dh. kommuniziert nicht nach "außen".
class TodoDetailsScreen extends StatefulWidget {
  const TodoDetailsScreen({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoDetailsScreen> createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo.topic),
      ), // AppBar
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 48), // SizedBox
            Text(
              "ID: ${widget.todo.id}",
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
                    value: widget.todo.isDone,
                    onChanged: (change) {
                      setState(() {
                        widget.todo.isDone = change ?? false;
                      });
                    }),
              ],
            ),
          ], // <Widget>[]
        ),
      ), // Padding
    ); // Scaffold
  }
}
