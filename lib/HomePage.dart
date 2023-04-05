import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int currentIndex = 1;
  final screens = <Widget>[
    const ProfilePage(),

    const HomePage(),
    const SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        screens[currentIndex],
        Positioned(
          left: 15,
          right: 15,
          bottom: 20,
          child: Container(
            clipBehavior:
                Clip.hardEdge, //or better look(and cost) using Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue[500],
              selectedItemColor: Colors.white,
              showUnselectedLabels: false,
              iconSize: 40,
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                  backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                  backgroundColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}







// Container(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text("sign in"),
// MaterialButton(onPressed: (){
// FirebaseAuth.instance.signOut();
// })
// ],
// ),
// ),
// );
