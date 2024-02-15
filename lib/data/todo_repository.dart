import 'package:the_todo_app/domain/todo.dart';

abstract class TodoRepository {
  Stream<List<Todo>> get todos;
  Future<void> setTodoCompletion(Todo todoToChange, bool isDone);
  void deleteTodo(Todo todo);
  void resetTodos();
}
