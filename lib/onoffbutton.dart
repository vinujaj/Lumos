import 'package:flutter/material.dart';

class OnOffButton extends StatefulWidget {
  final String label;
  final Function(bool) onPressed;

  OnOffButton({required this.label, required this.onPressed});
  @override
  _OnOffButtonState createState() => _OnOffButtonState();
}

class _OnOffButtonState extends State<OnOffButton> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _isOn ? Colors.blue : Colors.red;
    Color labelColor = _isOn ? Colors.white : Colors.white;
    String label = _isOn ? "On" : "Off";

    return GestureDetector(
      onTap: () {
        setState(() {
          _isOn = !_isOn;
        });
        widget.onPressed(_isOn);
      },
      child: Container(
        width: 320,
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 28),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                label,
                style: TextStyle(
                  color: labelColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
