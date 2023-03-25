import 'package:flutter/material.dart';

class OverlayHandGesture extends StatefulWidget {
  const OverlayHandGesture({super.key});

  @override
  State<OverlayHandGesture> createState() => _OverlayHandGestureState();
}

class _OverlayHandGestureState extends State<OverlayHandGesture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Home Setup "),
          centerTitle: true,
        ),
        body: const Padding(
            padding: EdgeInsets.all(10.0),
            // ignore: sort_child_properties_last
            child: RadioButtonGroup()));
  }
}

enum ButtonState {
  on,
  off,
  standby,
}

class RadioButtonGroup extends StatefulWidget {
  const RadioButtonGroup({super.key});

  @override
  _RadioButtonGroupState createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  ButtonState _selectedButton = ButtonState.off;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedButton = ButtonState.on;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: _selectedButton == ButtonState.on
                  ? Colors.green
                  : Colors.grey,
            ),
            child: RadioListTile(
              title: Text('On'),
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              //checkColor: Colors.white,
              activeColor: Colors.green,
              value: ButtonState.on,
              groupValue: _selectedButton,
              onChanged: (ButtonState? value) {
                setState(() {
                  _selectedButton = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedButton = ButtonState.off;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _selectedButton == ButtonState.off
                  ? Colors.green
                  : Colors.grey,
            ),
            child: RadioListTile(
              title: Text('Off'),
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              //checkColor: Colors.white,
              activeColor: Colors.green,
              value: ButtonState.off,
              groupValue: _selectedButton,
              onChanged: (ButtonState? value) {
                setState(() {
                  _selectedButton = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedButton = ButtonState.standby;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _selectedButton == ButtonState.standby
                  ? Colors.green
                  : Colors.grey,
            ),
            child: RadioListTile(
              title: Text('Standby'),
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              activeColor: Colors.green,
              value: ButtonState.standby,
              groupValue: _selectedButton,
              onChanged: (ButtonState? value) {
                setState(() {
                  _selectedButton = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
        ),
      ],
    );
  }
}
