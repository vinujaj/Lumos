// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'mainhandgesturepg.dart';
import 'package:modernlogintute/components/onoffbutton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primaryColor:
            Colors.blue, // specify a default background color for the app
      ),
      home: new SliderGrid(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SliderGrid extends StatefulWidget {
  const SliderGrid({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GridState createState() => new _GridState();
}

class _GridState extends State<SliderGrid> {
  var val = 5;

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Color.fromARGB(255, 82, 148, 248),
              Color.fromARGB(243, 255, 255, 255)
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          //padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "LUMOS",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Color.fromARGB(255, 247, 255, 98),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Brightness :",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Slider(
                        value: val.toDouble(),
                        min: 1.0,
                        max: 100.0,
                        divisions: 50,
                        label: '$val',
                        onChanged: (double newValue) {
                          setState(() {
                            val = newValue.round();
                            //imported the foundation dart
                            if (kDebugMode) {
                              print(val);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    margin: EdgeInsets.all(
                        10), // Add 20 pixels of margin around the container
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 85, 85,
                          85), // Set the background color of the container
                      borderRadius: BorderRadius.circular(
                          50), // Set the border radius of the container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                              0.3), // Set the shadow color and opacity
                          blurRadius: 14, // Set the blur radius of the shadow
                          offset: Offset(0, 3), // Set the offset of the shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(),
                        Center(
                          child: Text(
                            "Manual Control Light",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                        OnOffButton(
                          label: "On",
                          onPressed: (isOn) {
                            if (isOn) {
                              print("Button is on");
                            } else {
                              print("Button is off");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainHandGesture()));
                        },
                        child: Container(
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue[600],
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              // ignore: prefer_const_literals_to_create_immutables
                              colors: [
                                Color(0xFF3366FF),
                                Color(0xFF00CCFF),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/images/gesture_btn.png',
                                fit: BoxFit.cover,
                                // width: 40,
                                // height: 50,
                              ),
                              const Text(
                                "Customize Gesture",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
