import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_todo_app/presentation/todo_app.dart';
import 'package:the_todo_app/presentation/todo_model.dart';

import 'firebase_options.dart';

/// Schritte für SMS mit provider:
/// - Schritt 0: Package provider einbinden :)
/// - Schritt 1: Ein Model erstellen.
/// - Schritt 2: Das Model für die App per Provider zur Verfügung stellen.
/// - Schritt 3: Das Model verwenden (Consumer, context.watch, ...).
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    // Schritt 2: Das Model für die App zur Verfügung stellen.
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: const TodoApp(),
    ),
  );
}
