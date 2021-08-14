import 'package:flutter/material.dart';

class ElongatedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color buttonColour;
  final Color textColour;

  ElongatedButton({
    required this.text,
    required this.onPressed,
    required this.buttonColour,
    required this.textColour,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    return Container(
      width: _mediaQuery.size.width * 0.20,
      child: Material(
        color: buttonColour,
        borderRadius: BorderRadius.circular(20.0),
        child: MaterialButton(
          onPressed: onPressed,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18.0,
                  color: textColour,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
