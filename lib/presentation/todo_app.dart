import 'package:flutter/material.dart';
import 'package:the_todo_app/presentation/todo_main_screen.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoMainScreen(),
    );
  }
}
