import 'package:flutter/material.dart';
import 'core/di/injection.dart' as di;
import 'core/storage/local_storage.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local storage
  final localStorage = LocalStorage();
  await localStorage.init();

  // Initialize dependency injection
  await di.configureDependencies();

  runApp(const App());
}
