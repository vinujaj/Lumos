import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

import 'auth.dart';

class Scene extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

/*  void _submit() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String? errorMessage = await registerWithEmailAndPassword(email, password);
    if (errorMessage != null) {
      // Display error message to user
    } else {
      // Navigate to home screen
    }
  }*/

  Future<void> _createUserWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Handle successful user creation
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // Handle weak password error
      } else if (e.code == 'email-already-in-use') {
        // Handle email already in use error
      }
    } catch (e) {
      // Handle other errors
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // signupZq2 (1:24)
        width: double.infinity,
        height: 800*fem,
        decoration: const BoxDecoration (
          gradient: LinearGradient (
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[Color(0xff5194f7), Color(0xffeaf0f9)],
            stops: <double>[0, 1],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              // autogroup2pmaL72 (7T8DwTsDFb5kinvx3n2Pma)
              left: 15*fem,
              top: 20*fem,
              child: Container(
                width: 269*fem,
                height: 64*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // leftCf2 (1:41)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 26*fem, 0*fem),
                      width: 30*fem,
                      height: 30*fem,
                      child: Image.asset(
                        'assets/page-1/images/left-Jf2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      // createaccountFtC (1:25)
                      margin: EdgeInsets.fromLTRB(0*fem, 25*fem, 0*fem, 0*fem),
                      child: Text(
                        'Create Account',
                        style: SafeGoogleFont (
                          'Manrope',
                          fontSize: 28*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.365*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 35*fem,
              top: 304*fem,
              child: Container(
                width: 289*fem,
                height: 100*fem, // reduce the height to fit the content inside
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.96*fem),
                      child: Text(
                        'First Name',
                        style: SafeGoogleFont (
                          'Manrope',
                          fontSize: 13.9999990463*ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.365*ffem/fem,
                          color: Color(0xff5d5fef),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.47*fem, 8.06*fem, 10.47*fem, 7.99*fem),
                      width: double.infinity,
                      decoration: BoxDecoration (
                        border: Border.all(color: Color(0xffc5c5c5)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10*fem),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Dwayne',
                          border: InputBorder.none,
                        ),
                        style: SafeGoogleFont (
                          'Manrope',
                          fontSize: 12*ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.365*ffem/fem,
                          color: Color(0x6d1e1e1e),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 35*fem,
              top: 376*fem,
              child: Container(
                width: 289*fem,
                height: 100*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 0.96*fem),
                      child: Text(
                        'Last Name',
                        style: SafeGoogleFont (
                          'Manrope',
                          fontSize: 13.9999990463*ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.365*ffem/fem,
                          color: Color(0xff5d5fef),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.47*fem, 8.06*fem, 10.47*fem, 7.99*fem),
                      width: double.infinity,
                      decoration: BoxDecoration (
                        border: Border.all(color: Color(0xffc5c5c5)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10*fem),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Johnson',
                          hintStyle: SafeGoogleFont (
                            'Manrope',
                            fontSize: 12*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.365*ffem/fem,
                            color: Color(0x6d1e1e1e),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              // group96u7W (1:28)
              left: 35*fem,
              top: 448*fem,
              child: Container(
                width: 289*fem,
                height: 150*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // email1AY (I1:28;16:257)
                      margin: EdgeInsets.fromLTRB(0*fem, 20*fem, 0*fem, 0.96*fem),
                      child: Text(
                        'Email',
                        style: SafeGoogleFont (
                          'Manrope',
                          fontSize: 13.9999990463*ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.365*ffem/fem,
                          color: Color(0xff5d5fef),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupai56vYQ (7T8Ej2PdUbcAGczv2Qai56)
                      padding: EdgeInsets.fromLTRB(10.47*fem, 8.06*fem, 10.47*fem, 7.99*fem),
                      width: double.infinity,
                      decoration: BoxDecoration (
                        border: Border.all(color: Color(0xffc5c5c5)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10*fem),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'example@gmail.com', // You can customize the hint text
                          border: InputBorder.none,
                        ),
                        style: SafeGoogleFont (
                          'Manrope',
                          fontSize: 12*ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.365*ffem/fem,
                          color: Color(0x6d1e1e1e),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              // group97xV6 (1:29)
              left: 36*fem,
              top: 520*fem,
              child: Container(
                width: 289*fem,
                height: 150*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Email(
                      // emaileMv (I1:29;16:257)
                      margin: EdgeInsets.fromLTRB(0*fem, 30*fem, 0*fem, 0.96*fem),
                      child: Text(
                        'Password',
                        style: SafeGoogleFont (
                          'Manrope',
                          fontSize: 13.9999990463*ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.365*ffem/fem,
                          color: Color(0xff5d5fef),
                        ),
                      ),
                    ),
                    Container(
                      // autogrouprdsxAr4 (7T8ErXB91tybfn5H7NrdSx)
                      padding: EdgeInsets.fromLTRB(10.47*fem, 8.06*fem, 10.47*fem, 7.99*fem),
                      width: double.infinity,
                      decoration: BoxDecoration (
                        border: Border.all(color: Color(0xffc5c5c5)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10*fem),
                      ),
                      child: TextField(
                        obscureText: true, // hides the entered text with asterisks
                        decoration: const InputDecoration(
                          hintText: '********', // text that appears as a hint when the field is empty
                          border: InputBorder.none, // removes the default border
                        ),
                        style: SafeGoogleFont (
                          'Manrope',
                          fontSize: 12*ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.365*ffem/fem,
                          color: Color(0x6d1e1e1e),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 51 * fem,
              top: 645 * fem,
              child: ElevatedButton(
                onPressed: _createUserWithEmailAndPassword,
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff1e2f97),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                ),
              ),
            ),

            Positioned(
              // with7ep (1:31)
              left: 27*fem,
              top: 700*fem,
              child: Container(
                width: 306.6*fem,
                height: 17*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // line11EQ (1:33)
                      margin: EdgeInsets.fromLTRB(0*fem, 0.5*fem, 10*fem, 0*fem),
                      width: 119*fem,
                      height: 0.5*fem,
                      decoration: const BoxDecoration (
                        color: Color(0xff000000),
                      ),
                    ),
                    Container(
                      // orwith8pp (1:32)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                      child: Text(
                        'Or With',
                        style: SafeGoogleFont (
                          'Manrope',
                          fontSize: 12*ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.365*ffem/fem,
                          color: Color(0xff999ea1),
                        ),
                      ),
                    ),
                    Container(
                      // line2eoA (1:34)
                      margin: EdgeInsets.fromLTRB(0*fem, 0.5*fem, 0*fem, 0*fem),
                      width: 125.6*fem,
                      height: 0.5*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // autogrouppg4gBYC (7T8E9xWPpRN9iiitXPpG4g)
              left: 112*fem,
              top: 722*fem,
              child: Container(
                width: 136*fem,
                height: 32*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // google7Rr (1:37)
                      width: 32*fem,
                      height: 32*fem,
                      child: Image.asset(
                        'assets/page-1/images/google.png',
                        width: 32*fem,
                        height: 32*fem,
                      ),
                    ),
                    SizedBox(
                      width: 20*fem,
                    ),
                    Container(
                      // facebookctQ (1:35)
                      width: 32*fem,
                      height: 32*fem,
                      child: Image.asset(
                        'assets/page-1/images/facebook.png',
                        width: 32*fem,
                        height: 32*fem,
                      ),
                    ),
                    SizedBox(
                      width: 20*fem,
                    ),
                    Container(
                      // twitterusW (1:36)
                      width: 32*fem,
                      height: 32*fem,
                      child: Image.asset(
                        'assets/page-1/images/twitter.png',
                        width: 32*fem,
                        height: 32*fem,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // saly31Eun (1:38)
              left: 50*fem,
              top: 63*fem,
              child: Container(
                width: 260*fem,
                height: 260*fem,
                child: Center(
                  // saly31xat (1:39)
                  child: SizedBox(
                    width: 260*fem,
                    height: 260*fem,
                    child: Image.asset(
                      'assets/page-1/images/saly-31.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}