class Todo {
  Todo({required this.id, required this.topic, this.isDone = false});

  /// Damit kann ein Todo eindeutig identifiziert werden.
  final String id;

  /// Was erledigt werden soll.
  final String topic;

  /// Ob das Todo gemacht wurde.
  bool isDone;

  /// Erstellt ein Todo aus einer Map.
  factory Todo.fromMap(String todoId, Map<String, dynamic> map) {
    return Todo(
      id: todoId,
      topic: map['topic'] as String,
      isDone: map['isDone'] as bool,
    );
  }
}
