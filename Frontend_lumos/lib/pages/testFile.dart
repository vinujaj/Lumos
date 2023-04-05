import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtimeDemoScreen extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Realtime Database Demo'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              child: Text('Create Data'),
              // color: Colors.redAccent,
              onPressed: () {
                createData();
              },
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: Text('Read/View Data'),
              // color: Colors.redAccent,

              onPressed: () {
                readData();
              },
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: Text('Update Data'),
              // color: Colors.redAccent,

              onPressed: () {
                updateData();
              },
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: Text('Delete Data'),
              // color: Colors.redAccent,

              onPressed: () {
                deleteData();
              },
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ],
        ),
      )), //center
    );
  }

  void createData() {
    databaseReference.child("user1").set({
      'actions': ["o", "s", "s", "f"],
    });
    databaseReference.child("user2").set({
      'actions': ["s", "t", "w", "g"],
    });
  }

  void readData() {
    databaseReference.onValue.listen((event) {
      print('Data : ${event.snapshot.value}');
    });
  }

  void updateData() {
    databaseReference.child('flutterDevsTeam1').update({'description': 'CEO'});
    databaseReference
        .child('flutterDevsTeam2')
        .update({'description': 'Team Lead'});
    databaseReference
        .child('flutterDevsTeam3')
        .update({'description': 'Senior Software Engineer'});
  }

  void deleteData() {
    databaseReference.child('user1').remove();
  }
}
