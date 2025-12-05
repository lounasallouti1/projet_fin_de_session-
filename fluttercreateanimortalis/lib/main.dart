import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const AnimortalisApp());
}

class AnimortalisApp extends StatelessWidget {
  const AnimortalisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animortalis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const LoginPage(),
    );
  }
}
