import 'package:flutter/material.dart';
//import 'package:zoom_clone/util/colors.dart';

class Custombuttons extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Custombuttons({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 51, 255),
        minimumSize: const Size(100, 47),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 17, color: Colors.white),
      ),
    );
  }
}
