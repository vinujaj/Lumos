import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//List model getlist from github

ListTile getListTile(icon, iconColor, titleText, context, index) {
  return ListTile(
    // ignore: sized_box_for_whitespace
    leading: Container(
      width: 4.0,
      child: Icon(
        icon,
        color: iconColor,
        size: 30.0,
      ),
    ),
    title: Text(
      titleText,
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
    ),
    onTap: () {
      temp[index] = titleText;
      Navigator.pop(context, titleText);
    },
  );
}

class MainHandGesture extends StatefulWidget {
  const MainHandGesture({super.key});

  @override
  State<MainHandGesture> createState() => _MainHandGestureState();
}

final databaseReference = FirebaseDatabase.instance.ref();

//read from the server for a user at the moment

List<String> selectedAction = [
  'Switch ON',
  'Switch OFF',
  'Colour Change',
  'Party Mode'
];

List<String> temp = [
  'Switch ON',
  'Colour Change',
  'Colour Change',
  'Party Mode'
];

List<String> parseActions(String actionsStr) {
  RegExp regExp = RegExp(r'\[(.*?)\]');
  RegExpMatch? match = regExp.firstMatch(actionsStr);
  String? actionsListStr = match?.group(1);
  return actionsListStr!.split(', ');
}

void createData() {
  databaseReference.child("user1").set({
    'action': ["o", "s", "s", "f"],
  });
  databaseReference.child("user2").set({
    'action': ["s", "t", "w", "g"],
  });
}

void getUserId() {}

void readData(String childNode) async {
  databaseReference.child(childNode).keepSynced(true);
  databaseReference.child(childNode).onValue.listen((event) {
    String value = '${event.snapshot.value}';
    selectedAction = parseActions(value);
    print("$selectedAction + gackk");
    //print(value);
  });
}

//pass parameter(user id , list string)
void updateData(String child) {
  databaseReference.child(child).update(
    {'action': temp},
  );
}

void _openBottomSheet(context, int index) async {
  selectedAction[index] = await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (builder) {
      return Container(
        padding: const EdgeInsets.all(5.0),
        child: Wrap(
          children: <Widget>[
            const Center(
              child: Padding(
                padding: EdgeInsets.all(13.0),
                child: Text(
                  "Change Action",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 255, 174, 0)),
                ),
              ),
            ),
            const Divider(
              thickness: 2.0,
              height: 5.0,
            ),
            getListTile(
                Icons.lightbulb, Colors.yellow, "Switch ON", context, index),
            getListTile(Icons.lightbulb_outlined, Colors.black, "Switch OFF",
                context, index),
            getListTile(
                Icons.color_lens, Colors.blue, "Colour Change", context, index),
            getListTile(
                Icons.party_mode, Colors.red, "Party Mode", context, index),
          ],
        ),
      );
    },
  );
  if (kDebugMode) {
    print(selectedAction[index]);
  }
}

class _MainHandGestureState extends State<MainHandGesture> {
  void setSelectedAction(String action, int i) {
    setState(() {
      selectedAction[i] = action;
    });
  }

  @override
  Widget build(BuildContext context) {
    readData("user1");
    print("The read data above");
    print(temp);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customize Your Gestures"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 82, 148, 248),
                Color.fromARGB(243, 255, 255, 255)
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
              children: [
                InkWell(
                  onTap: () {
                    _openBottomSheet(context, 0);
                    setSelectedAction(selectedAction[0], 0);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const OverlayHandGesture()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/images/ok_sign.png',
                          width: 80,
                          height: 80,
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Text(
                          selectedAction[0],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 82, 148, 248),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _openBottomSheet(context, 1);
                    setSelectedAction(selectedAction[1], 1);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/images/handup.png',
                          width: 80,
                          height: 80,
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Text(
                          selectedAction[1],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 82, 148, 248),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _openBottomSheet(context, 2);
                    setSelectedAction(
                        selectedAction[2], 2); //store the image as well
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/images/closedfist.png',
                          width: 80,
                          height: 80,
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Text(
                          selectedAction[2],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 82, 148, 248),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _openBottomSheet(context, 3);
                    setSelectedAction(selectedAction[3], 3);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/images/thumsup.png',
                          width: 80,
                          height: 80,
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Text(selectedAction[3],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 82, 148, 248),
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (kDebugMode) {
                      print("$selectedAction + selec stuff");
                      print("$temp + temp stuff");
                      readData("user1");
                      updateData("user1");
                    }

                    //it will write to the server
                    Navigator.pop(context);

                    //store the selection
                    //send it to the server
                  },
                  child: Image.asset(
                    'lib/images/backbutton.jpg',
                    width: 80,
                    height: 80,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
