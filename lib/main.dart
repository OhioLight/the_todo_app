import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/todo_app.dart';
import 'package:the_todo_app/todo_provider.dart';

/// Schritte für SMS mit provider:
/// - Schritt 0: Package provider einbinden :)
/// - Schritt 1: Einen Provider erstellen.
/// - Schritt 2: Den Provider für die App zur Verfügung stellen.
/// - Schritt 3: Den Provider verwenden (Consumer, context.watch, ...).
void main() {
  runApp(
    // Schritt 2: Den Provider für die App zur Verfügung stellen.
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MyApp(),
    ),
  );
}
