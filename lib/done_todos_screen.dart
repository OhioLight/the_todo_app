import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/todo_item.dart';
import 'package:the_todo_app/todo_provider.dart';

class DoneTodosScreen extends StatelessWidget {
  const DoneTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final provider = context.watch<TodoProvider>();
    final provider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Open Todos",
          style: TextStyle(fontSize: 32),
        ),
        backgroundColor: Colors.lightBlue[500],
      ),
      body: ListView.builder(
        itemCount: provider.doneTodos.length,
        itemBuilder: (context, index) {
          return TodoItem(todo: provider.doneTodos[index]);
        },
      ),
    );
  }
}
