import 'package:flutter/material.dart';
import 'package:the_todo_app/todo.dart';
import 'package:the_todo_app/todo_details_screen.dart';

// Speichert seinen eigenen State, dh. kommuniziert nicht nach "außen".
class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoDetailsScreen(todo: widget.todo),
          ),
        );
      },
      child: ListTile(
        leading: Checkbox(
          value: widget.todo.isDone,
          onChanged: (bool? value) {
            setState(() {
              widget.todo.isDone = value ?? false;
            });
          },
        ), // Checkbox
        title: Text(widget.todo.topic),
      ),
    ); // ListTile
  }
}
