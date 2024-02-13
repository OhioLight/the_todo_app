import 'package:the_todo_app/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> get todos;
  Future<void> toggleTodo(Todo todoToChange);
}
