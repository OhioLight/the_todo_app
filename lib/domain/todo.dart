class Todo {
  Todo({required this.id, required this.topic, this.isDone = false});

  /// Damit kann ein Todo eindeutig identifiziert werden.
  final int id;

  /// Was erledigt werden soll.
  final String topic;

  /// Ob das Todo gemacht wurde.
  bool isDone;
}
