// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unittoni_tasks/Home/presentation/pages/home_page.dart';

import 'core/di/injection_container.dart' as di;
import 'package:logging/logging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.configureInjection();
  runApp(const MyApp());
  Logger.root.level =
  !kDebugMode ? Level.OFF : Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    log(
      '${record.loggerName}: ${record.message}',
      level: record.level.value,
      name: record.level.name,
      time: record.time,
      error: record.error,
      stackTrace: record.stackTrace,
      zone: record.zone,
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unitoni Tasks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}


