import 'package:the_todo_app/domain/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> get todos;
  Future<void> setTodoCompletion(Todo todoToChange, bool isDone);
}
