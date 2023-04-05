import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modernlogintute/pages/SplashScreen.dart';
import 'main_page.dart';
import 'pages/login_page.dart';
import 'package:async/async.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => MainPage()),
  //       // MaterialPageRoute(builder: (context) => LoginPage()),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lumos App - Hand Gesture Recognition App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: Image.asset(
//           'lib/images/main_splash.jpg',
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }
