import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blue.shade300],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        minRadius: 60.0,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('images/person.jpg'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Leonardo Palmeiro',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Usage : 12 Hours',
                    style: TextStyle(
                      color: Colors.amber[400],
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  // Expanded(
                  //   child: Container(
                  //     color: Colors.deepOrange.shade300,
                  //     child: ListTile(
                  //       title: Text(
                  //         '5000',
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 30,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       subtitle: Text(
                  //         'Followers',
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           fontSize: 20,
                  //           color: Colors.white70,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Container(
                  //     color: Colors.red,
                  //     child: ListTile(
                  //       title: Text(
                  //         '5000',
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 30,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       subtitle: Text(
                  //         'Following',
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           fontSize: 20,
                  //           color: Colors.white70,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.blue[300],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'palmeiro.leonardo@gmail.com',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Linkedin',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'www.linkedin.com/in/leonardo-palmeiro-834a1755',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
