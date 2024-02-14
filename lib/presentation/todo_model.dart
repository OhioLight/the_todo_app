import 'package:flutter/material.dart';
import 'package:the_todo_app/data/firebase_todo_repository.dart';
import 'package:the_todo_app/data/todo_repository.dart';
import 'package:the_todo_app/domain/todo.dart';

enum TodoModelStatus { loading, loaded, error }

// Schritt 1: Model erstellen
class TodoModel extends ChangeNotifier {
  /// Hiermit werden die Todos aus Firebase geholt und gespeichert.
  final TodoRepository _todoRepository = FirebaseTodoRepository();

  /// Wird verwendet, amit in der UI ein Progress Bar, ein Fehler oder die
  /// eigentlichen Todos angezeigt werden können.
  TodoModelStatus _todoModelStatus = TodoModelStatus.loading;

  /// Merkt sich die Todos für die UI. Muss mit Firestore synchronisiert werden.
  final List<Todo> _todos = [];

  // /// Das hier ist der State, der in allen Widgets verwendet werden soll.
  // /// Dafür muss er natürlich auch von den Widgets angepasst werden.
  // final List<Todo> _todos = [
  //   Todo(id: 0, topic: "Frühstücken", isDone: true),
  //   Todo(id: 1, topic: "Clojure lernen"),
  //   Todo(id: 2, topic: "Vorlesung vorbereiten", isDone: true),
  //   Todo(id: 3, topic: "Tasksheet vorbereiten", isDone: true),
  //   Todo(id: 4, topic: "Lego bauen"),
  // ];

  TodoModel() {
    //_loadTodos();
    _loadTodosStream();
  }

  TodoModelStatus get todoProviderStatus => _todoModelStatus;
  List<Todo> get todos => _todos;

  Future<void> _loadTodosStream() async {
    try {
      _todoRepository.todos.listen((todos) {
        _todos.clear();
        _todos.addAll(todos);
        _todoModelStatus = TodoModelStatus.loaded;
        notifyListeners();
      });
    } catch (e) {
      _todoModelStatus = TodoModelStatus.error;
      notifyListeners();
    }
  }

  /// Gibt eine Liste von Todos zurück, die offen sind.
  List<Todo> get openTodos => _todos.where((todo) => !todo.isDone).toList();

  // List<Todo> get openTodos {
  //   final openTodos = <Todo>[];
  //   for (final todo in todos) {
  //     if (!todo.isDone) {
  //       openTodos.add(todo);
  //     }
  //   }
  //   return openTodos;
  // }

  /// Gibt eine Liste von Todos zurück, die erledigt wurden.
  List<Todo> get doneTodos => _todos.where((todo) => todo.isDone).toList();

  // List<Todo> get doneTodos {
  //   final doneTodos = <Todo>[];
  //   for (final todo in todos) {
  //     if (todo.isDone) {
  //       doneTodos.add(todo);
  //     }
  //   }
  //   return doneTodos;
  // }

  void toggleTodo(Todo todo) {
    // Todo finden
    Todo todoToChange = _todos.firstWhere((element) => element.id == todo.id);

    // Todo anpassen :)
    todoToChange.isDone = !(todoToChange.isDone);
    _todoRepository.setTodoCompletion(todoToChange, todoToChange.isDone);
    notifyListeners();
  }
}
