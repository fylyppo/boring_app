import 'package:flutter/material.dart';

import '../sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      home: const SignInPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}