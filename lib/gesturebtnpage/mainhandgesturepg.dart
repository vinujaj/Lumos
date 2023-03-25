import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lumosappsdgp/gesturebtnpage/handgesturepg.dart';

//List model getlist from github
late String selectedAction;
ListTile getListTile(
  icon,
  iconColor,
  titleText,
  context,
) {
  return ListTile(
    // ignore: sized_box_for_whitespace
    leading: Container(
      width: 4.0,
      child: Icon(
        icon,
        color: iconColor,
        size: 24.0,
      ),
    ),
    title: Text(
      titleText,
      style: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
      ),
    ),
    onTap: () {
      Navigator.pop(context, titleText);
    },
  );
}

// class HandGesture {
//   final String gestureName;
//   String gestureAction;
//   final File image; //File image = File('/path/to/image.jpg');
//   final String firebaseValue;

//   HandGesture(
//       {required this.gestureName,
//       required this.gestureAction,
//       required this.image,
//       required this.firebaseValue});
// }

class MainHandGesture extends StatefulWidget {
  const MainHandGesture({super.key});

  @override
  State<MainHandGesture> createState() => _MainHandGestureState();
}

class _MainHandGestureState extends State<MainHandGesture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Controls "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
          children: [
            InkWell(
              onTap: () {
                _openBottomSheet(context);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const OverlayHandGesture()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[600],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/ok_sign.png',
                      width: 80,
                      height: 80,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Text(
                      selectedAction,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _openBottomSheet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[600],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/handup.png',
                      width: 80,
                      height: 80,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Text(
                      selectedAction,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _openBottomSheet(context); //store the image as well
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[600],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/closedfist.png',
                      width: 80,
                      height: 80,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Text(
                      selectedAction,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _openBottomSheet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[600],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/thumsup.png',
                      width: 80,
                      height: 80,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Text(selectedAction,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _openBottomSheet(context) async {
  //TODO PARAMATETER OT STORE THE IMAGE
  selectedAction = await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (builder) {
      return Container(
        padding: const EdgeInsets.all(5.0),
        child: Wrap(
          children: <Widget>[
            const Center(
              child: Text(
                "Change Action",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 255, 174, 0)),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.blue[600],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          'images/thumsup.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 2.0,
              height: 5.0,
            ),
            getListTile(
              Icons.lightbulb,
              Colors.yellow,
              "Switch ON",
              context,
            ),
            getListTile(
              Icons.lightbulb_outlined,
              Colors.black,
              "Switch OFF",
              context,
            ),
            getListTile(
              Icons.color_lens,
              Colors.blue,
              "Colour Change",
              context,
            ),
            getListTile(
              Icons.party_mode,
              Colors.red,
              "Party Mode",
              context,
            ),
          ],
        ),
      );
    },
  );
  if (kDebugMode) {
    print(selectedAction);
  }
}
