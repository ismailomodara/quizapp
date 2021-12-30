import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String buttonType = 'primary';
  String buttonText;
  final VoidCallback onPressed;

  Button(
      {required this.buttonType,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            buttonType == 'primary' ? Colors.teal : Colors.black54),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(20),
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
