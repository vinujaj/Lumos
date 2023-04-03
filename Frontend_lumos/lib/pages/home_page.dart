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
      title: 'Home pAge',
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
      appBar: AppBar(
        title: Center(child: Text("LUMOS")),
        backgroundColor: Color.fromARGB(197, 0, 107, 194),
        //elevation: 1.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Color.fromARGB(255, 236, 236, 236),
              Color.fromARGB(255, 191, 239, 251),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          //padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.light,
                    size: 40,
                    color: Colors.amberAccent,
                  ),
                  Text("Welcome",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.light,
                    size: 40,
                    color: Colors.amberAccent,
                    // the opacity of the icon (0.0 = fully transparent, 1.0 = fully opaque)
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Brightness :",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
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
              Divider(),
              Center(
                child: Text(
                  "Manual Control Light",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 28, 165, 250)),
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
              Divider(
                height: 10,
              ),
              Center(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 39, 138, 219),
                  child: Center(
                    child: Text(
                      "Gesture Controls",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              )),
              Row(
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
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
