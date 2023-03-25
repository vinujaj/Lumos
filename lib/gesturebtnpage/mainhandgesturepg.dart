import 'package:flutter/material.dart';
import 'package:lumosappsdgp/gesturebtnpage/handgesturepg.dart';

class MainHandGesture extends StatefulWidget {
  const MainHandGesture({super.key});

  @override
  State<MainHandGesture> createState() => _MainHandGestureState();
}

class _MainHandGestureState extends State<MainHandGesture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Controls "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OverlayHandGesture()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[600],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/ok_sign.png',
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Do something when the button is tapped
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[600],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/handup.png',
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Do something when the button is tapped
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[600],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/closedfist.png',
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Do something when the button is tapped
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[600],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/thumsup.png',
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
