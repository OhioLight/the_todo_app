import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_todo_app/data/todo_repository.dart';
import 'package:the_todo_app/domain/todo.dart';

// // Eine Liste von so genannten Records, einer speziellen Art von Tupeln :)
// final List<({String topic, bool isDone})> _defaultTodos = [
//   (topic: "Frühstücken", isDone: true),
//   (topic: "Clojure lernen", isDone: false),
//   (topic: "Vorlesung vorbereiten", isDone: true),
//   (topic: "Tasksheet vorbereiten", isDone: true),
//   (topic: "Lego bauen", isDone: false),
// ];

final List<Todo> _defaultTodos = [
  Todo(id: "UNUSED", topic: "Frühstücken", isDone: true),
  Todo(id: "UNUSED", topic: "Clojure lernen"),
  Todo(id: "UNUSED", topic: "Vorlesung vorbereiten", isDone: true),
  Todo(id: "UNUSED", topic: "Tasksheet vorbereiten", isDone: true),
  Todo(id: "UNUSED", topic: "Lego bauen"),
];

class FirebaseTodoRepository implements TodoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Todo>> get todos => _firestore
      .collection('todos')
      .snapshots()
      .map((s) => s.docs.map((e) => Todo.fromFirestore(e)).toList());

  // @override
  // Stream<List<Todo>> get todos {
  //   final CollectionReference<Map<String, dynamic>> todoCollectionRef =
  //       _firestore.collection('todos');
  //   final Stream<QuerySnapshot<Map<String, dynamic>>> todosSnapshotStream =
  //       todoCollectionRef.snapshots();
  //   return todosSnapshotStream.map((snapshot) {
  //     final List<QueryDocumentSnapshot<Map<String, dynamic>>> todoDocuments =
  //         snapshot.docs;
  //     final List<Todo> retrievedTodos = [];
  //     for (final todoDocument in todoDocuments) {
  //       retrievedTodos.add(Todo.fromFirestore(todoDocument));
  //     }
  //
  //     return retrievedTodos;
  //   });
  // }

  @override
  Future<void> setTodoCompletion(Todo todoToChange, bool isDone) async {
    // Todo von Firestore updaten
    final CollectionReference<Map<String, dynamic>> todoCollectionRef =
        _firestore.collection('todos');
    await todoCollectionRef.doc(todoToChange.id).update({
      'isDone': isDone,
    });
  }

  @override
  void resetTodos() {
    final CollectionReference<Map<String, dynamic>> todoCollectionRef =
        _firestore.collection('todos');
    todoCollectionRef.get().then((snapshot) {
      for (final doc in snapshot.docs) {
        doc.reference.delete();
      }
    }).then((_) {
      for (final todo in _defaultTodos) {
        todoCollectionRef.add({
          'topic': todo.topic,
          'isDone': todo.isDone,
        });
      }
    });
  }

  @override
  void deleteTodo(Todo todo) {
    final CollectionReference<Map<String, dynamic>> todoCollectionRef =
        _firestore.collection('todos');
    todoCollectionRef.doc(todo.id).delete();
  }
}
