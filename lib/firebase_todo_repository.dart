import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_todo_app/todo.dart';
import 'package:the_todo_app/todo_repository.dart';

class FirebaseTodoRepository implements TodoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<Todo>> get todos async {
    final CollectionReference<Map<String, dynamic>> todoCollectionRef =
        _firestore.collection('todos');
    final QuerySnapshot<Map<String, dynamic>> todosSnapshot =
        await todoCollectionRef.get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> todos =
        todosSnapshot.docs;

    final List<Todo> retrievedTodos = [];
    for (final QueryDocumentSnapshot<Map<String, dynamic>> todo in todos) {
      final todoId = todo.id;
      final Map<String, dynamic> data = todo.data();
      retrievedTodos.add(Todo.fromMap(todoId, data));
    }

    return retrievedTodos;
  }

  @override
  Future<void> toggleTodo(Todo todoToChange) async {
    // TODO: implement toggleTodo
  }
}
