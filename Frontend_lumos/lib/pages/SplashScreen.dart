import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';

import '../main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     // image: AssetImage('lib/images/bg.jpg'),
        //     image: AssetImage('lib/images/bg.png'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SafeArea(
          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'lib/images/main_splash.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ),
    );
  }
}
