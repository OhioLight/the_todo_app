import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_todo_app/data/todo_repository.dart';
import 'package:the_todo_app/domain/todo.dart';

class FirebaseTodoRepository implements TodoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Todo>> get todos {
    final CollectionReference<Map<String, dynamic>> todoCollectionRef =
        _firestore.collection('todos');
    final Stream<QuerySnapshot<Map<String, dynamic>>> todosSnapshotStream =
        todoCollectionRef.snapshots();

    return todosSnapshotStream.map((snapshot) {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> todoDocuments =
          snapshot.docs;

      final List<Todo> retrievedTodos = [];
      for (final todoDocument in todoDocuments) {
        retrievedTodos.add(Todo.fromFirestore(todoDocument));
      }

      return retrievedTodos;
    });
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
