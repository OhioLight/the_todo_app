import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/presentation/done_todos_screen.dart';
import 'package:the_todo_app/presentation/open_todos_screen.dart';
import 'package:the_todo_app/presentation/todo_list_item.dart';
import 'package:the_todo_app/presentation/todo_model.dart';

class TodoMainScreen extends StatelessWidget {
  const TodoMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Schritt 3: Das Model verwenden.
    //final TodoModel todoModel = context.watch<TodoModel>();
    final TodoModel todoModel = Provider.of<TodoModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo App",
          style: TextStyle(fontSize: 32),
        ),
        backgroundColor: Colors.lightBlue[500],
        actions: [
          TextButton(
            onPressed: () {
              todoModel.resetTodos();
            },
            child: const Icon(Icons.replay_circle_filled_sharp),
          ),
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
                  todoModel.openTodos.length.toString(),
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
                  todoModel.doneTodos.length.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      ),
      body: switch (todoModel.todoProviderStatus) {
        TodoModelStatus.error =>
          const Center(child: Text("Fehler beim Laden der Todos")),
        TodoModelStatus.loaded => ListView.builder(
            itemCount: todoModel.todos.length,
            itemBuilder: (context, index) {
              return TodoListItem(todo: todoModel.todos[index]);
            },
          ),
        TodoModelStatus.loading =>
          const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
