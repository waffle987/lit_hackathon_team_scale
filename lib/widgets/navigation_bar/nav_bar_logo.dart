import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/config/ui_helpers.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 150,
      child: Container(color: primaryColor),
      // child: Image.asset('assets/logo.png'),
    );
  }
}
