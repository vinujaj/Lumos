import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//List model getlist from github

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

class MainHandGesture extends StatefulWidget {
  const MainHandGesture({super.key});

  @override
  State<MainHandGesture> createState() => _MainHandGestureState();
}

List<String> selectedAction = [
  'Switch ON',
  'Switch OFF',
  'Colour Change',
  'Party Mode'
];

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
              child: Text(
                "Change Action",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 255, 174, 0)),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Controls "),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red, Colors.orange, Colors.yellow]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
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
                    color: Colors.blue[600],
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
                  _openBottomSheet(context, 1);
                  setSelectedAction(selectedAction[1], 1);
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
                  _openBottomSheet(context, 2);
                  setSelectedAction(
                      selectedAction[2], 2); //store the image as well
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
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 255, 255, 255)),
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
                    color: Colors.blue[600],
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
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ],
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print(selectedAction);
                    }
                    Navigator.pop(context);

                    //store the selection
                  },
                  child: const Text("Update or \n Go Back"))
            ],
          ),
        ),
      ),
    );
  }
}
