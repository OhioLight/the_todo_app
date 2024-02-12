import 'package:flutter/material.dart';
import 'package:the_todo_app/todo.dart';
import 'package:the_todo_app/todo_main_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Das hier ist der State, der in allen Widgets verwendet werden soll.
  /// Dafür muss er natürlich auch von den Widgets angepasst werden.
  final List<Todo> todos = [
    Todo(id: 0, topic: "Frühstücken", isDone: true),
    Todo(id: 1, topic: "Clojure lernen"),
    Todo(id: 2, topic: "Vorlesung vorbereiten", isDone: true),
    Todo(id: 3, topic: "Tasksheet vorbereiten", isDone: true),
    Todo(id: 4, topic: "Lego bauen"),
  ];

  /// Gibt eine Liste von Todos zurück, die offen sind.
  List<Todo> get openTodos {
    final openTodos = <Todo>[];
    for (final todo in todos) {
      if (!todo.isDone) {
        openTodos.add(todo);
      }
    }
    return openTodos;
  }

  /// Gibt eine Liste von Todos zurück, die erledigt wurden.
  List<Todo> get doneTodos {
    final doneTodos = <Todo>[];
    for (final todo in todos) {
      if (todo.isDone) {
        doneTodos.add(todo);
      }
    }
    return doneTodos;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoMainScreen(
        openTodos: openTodos,
        doneTodos: doneTodos,
        todos: todos,
        onChangeCallback: (todoId, newState) {
          Todo? todoToChange;
          // Todo finden, das angepasst werden muss.
          for (final currentTodo in todos) {
            if (currentTodo.id == todoId) {
              todoToChange = currentTodo;
            }
          }
          // Todo anpassen :)
          todoToChange?.isDone = newState;
          setState(() {});
        },
      ),
    );
  }
}
