import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  get user => FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.email!),
            MaterialButton(onPressed: (){
              FirebaseAuth.instance.signOut();
            },
            color: Colors.blueAccent,
            child: Text('Sign -Out'),)
          ],
    )
      ),
      );
  }
}
