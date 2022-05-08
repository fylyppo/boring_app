import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'firebase_options.dart';
import 'injection.dart';
import 'presentation/core/app_widget.dart';
import 'presentation/routes/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  getIt.registerSingleton<AppRouter>(AppRouter());
  configureInjection(Environment.prod);
  runApp(const AppWidget());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boring App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}
