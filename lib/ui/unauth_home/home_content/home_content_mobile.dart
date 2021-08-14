import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/ui/unauth_home/home_details.dart';
import 'package:lit_hackathon_team_scale/widgets/call_to_action/call_to_action.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HomeDetails(),
          SizedBox(
            height: 100,
          ),
          CallToAction('Login'),
        ],
      ),
    );
  }
}
