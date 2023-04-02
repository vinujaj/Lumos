import 'package:flutter/material.dart';
import 'main_page.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lumos App - Hand Gesture Recognition App',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
