import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function() function;
  final Color buttonColour;
  final Color iconColour;

  const CircleButton({
    required this.icon,
    required this.function,
    required this.buttonColour,
    required this.iconColour,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: CircleAvatar(
        backgroundColor: buttonColour,
        child: Icon(
          icon,
          color: iconColour,
        ),
      ),
    );
  }
}
