import 'package:flutter/material.dart';
class MyButton extends MaterialButton {
  final String text;
  final VoidCallback onPressed;

  MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(
          key: key,
          onPressed: onPressed,
          color: const Color.fromARGB(255, 3, 2, 78),
          child: Text(text, style: const TextStyle(color: Colors.white)),
        );
}
