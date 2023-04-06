// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// class FirebaseRealtimeDemoScreen extends StatelessWidget {
//   final databaseReference = FirebaseDatabase.instance.ref();
//
//   @override
//   Widget build(BuildContext context) {
//     readData();
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text('Flutter Realtime Database Demo'),
//       ),
//       body: Center(
//           child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             ElevatedButton(
//               child: Text('Create Data'),
//               // color: Colors.redAccent,
//               onPressed: () {
//                 createData();
//               },
//               // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             ElevatedButton(
//               child: Text('Read/View Data'),
//               // color: Colors.redAccent,
//
//               onPressed: () {
//                 readData();
//               },
//               // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             ElevatedButton(
//               child: Text('Update Data'),
//               // color: Colors.redAccent,
//
//               onPressed: () {
//                 updateData();
//               },
//               // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             ElevatedButton(
//               child: Text('Delete Data'),
//               // color: Colors.redAccent,
//
//               onPressed: () {
//                 deleteData();
//               },
//               // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//           ],
//         ),
//       )), //center
//     );
//   }
//
//   void createData() {
//     databaseReference.child("user1").set({
//       'actions': ["o", "s", "s", "f"],
//     });
//     databaseReference.child("user2").set({
//       'actions': ["s", "t", "w", "g"],
//     });
//   }
//
//   void readData() {
//     databaseReference.onValue.listen((event) {
//       print('Data : ${event.snapshot.value}');
//     });
//   }
//
//   void updateData() {
//     databaseReference.child('flutterDevsTeam1').update({'description': 'CEO'});
//     databaseReference.child('user1').update({
//       'actions': ["Switch ON", "Switch OFF", "Change Color", "Party Mode"]
//     });
//   }
//
//   void deleteData() {
//     databaseReference.child('user2').remove();
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email, _password, _errorMessage;

  bool _isLoading = false;

  void _submit() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _isLoading = true;
      });
      String result = await signIn(_email, _password);
      setState(() {
        _isLoading = false;
        _errorMessage = result;
      });
      if (result == 'Logged in') {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Logged in';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return "error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input!.isEmpty) {
                    return 'Please type an email';
                  }
                  return null;
                },
                onSaved: (input) => _email = input!,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                validator: (input) {
                  if (input!.isEmpty) {
                    return 'Please type a password';
                  }
                  return null;
                },
                onSaved: (input) => _password = input!,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 20.0,
              ),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _submit,
                child: Text('Login'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                _errorMessage ?? '',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}