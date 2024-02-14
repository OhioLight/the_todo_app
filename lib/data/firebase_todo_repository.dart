import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_todo_app/data/todo_repository.dart';
import 'package:the_todo_app/domain/todo.dart';

class FirebaseTodoRepository implements TodoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Todo>> get todos async {
    final CollectionReference<Map<String, dynamic>> todoCollectionRef =
        _firestore.collection('todos');
    final QuerySnapshot<Map<String, dynamic>> todosSnapshot =
        await todoCollectionRef.get();
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> todoDocuments =
        todosSnapshot.docs;

    final List<Todo> retrievedTodos = [];
    for (final todoDocument in todoDocuments) {
      retrievedTodos.add(Todo.fromFirestore(todoDocument));
    }

    return retrievedTodos;
  }

  @override
  Future<void> setTodoCompletion(Todo todoToChange, bool isDone) async {
    // Todo von Firestore updaten
    final CollectionReference<Map<String, dynamic>> todoCollectionRef =
        _firestore.collection('todos');
    await todoCollectionRef.doc(todoToChange.id).update({
      'isDone': isDone,
    });
  }
}
