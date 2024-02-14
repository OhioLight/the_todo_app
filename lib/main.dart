import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/todo_app.dart';
import 'package:the_todo_app/todo_provider.dart';

/// Schritte für SMS mit provider:
/// - Schritt 0: Package provider einbinden :)
/// - Schritt 1: Ein Model erstellen.
/// - Schritt 2: Das Model für die App mit einem Provider zur Verfügung stellen.
/// - Schritt 3: Das Model verwenden (Consumer, context.watch, ...).
void main() {
  runApp(
    // Schritt 2: Das Model für die App mit einem Provider zur Verfügung stellen.
    ChangeNotifierProvider(
      create: (context) => TodosModel(),
      child: const MyApp(),
    ),
  );
}
