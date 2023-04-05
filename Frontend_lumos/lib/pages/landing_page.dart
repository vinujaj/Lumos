import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';


import '../main_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  LandingPageState createState() => LandingPageState();
}
class LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[300],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            // image: AssetImage('lib/images/bg.jpg'),
            image: AssetImage('lib/images/Landing_Screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.blue,
                  //     minimumSize: Size(200, 50),
                  //   ),
                  //   child: Text('Login'),
                  // ),
                  // SizedBox(height: 16),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.blue,
                  //     minimumSize: Size(200, 50),
                  //   ),
                  //   child: Text('Signup'),
                  // ),

                  // Text(
                  //   'Hello',
                  //   style: TextStyle(
                  //     fontSize: 32,
                  //     fontStyle: FontStyle.italic,
                  //     fontWeight: FontWeight.bold,
                  //     fontFamily: 'Your font name', // Replace with your font name
                  //   ),
                  // ),
                  SizedBox(height: 66),
                  Text(
                  'Lighting at your fingertips.',
                  style: GoogleFonts.sacramento (
                    textStyle: const TextStyle (fontSize: 40),
                  ),),
                  // Text(
                  //   'Lighting at your fingertips.',
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontStyle: FontStyle.italic,
                  //     fontFamily: 'Your font name', // Replace with your font name
                  //   ),
                  // ),
                  SizedBox(height: 62),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          minimumSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          ),
                        ),
                        child: Text('Login'),
                      ),
                      SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue, width: 2),
                          minimumSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          ),
                        ),
                        child: Text(
                          'Signup',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],


        // child: SafeArea(
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Image.asset(
        //           'lib/images/Landing_Screen.jpg',
        //           fit: BoxFit.cover,
        //         ),
        //         SizedBox(height: 20),
        //         ElevatedButton(
        //           onPressed: () {
        //             // Navigate to login screen
        //           },
        //           child: Text('Login'),
        //         ),
        //         SizedBox(height: 10),
        //         ElevatedButton(
        //           onPressed: () {
        //             // Navigate to signup screen
        //           },
        //           child: Text('Sign up'),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    ),
    ),
    ),
      ),
    );
  }
}