import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/todo_item.dart';
import 'package:the_todo_app/todo_provider.dart';

class OpenTodosScreen extends StatelessWidget {
  const OpenTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final todosModel = context.watch<TodosModel>();
    final todosModel = Provider.of<TodosModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Open Todos",
          style: TextStyle(fontSize: 32),
        ),
        backgroundColor: Colors.lightBlue[500],
      ),
      body: ListView.builder(
        itemCount: todosModel.openTodos.length,
        itemBuilder: (context, index) {
          return TodoItem(todo: todosModel.openTodos[index]);
        },
      ),
    );
  }
}
