import 'package:flutter/material.dart';


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Background Photo',
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                'images/main_splash.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text(
                'Hello, world!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
