import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/ui/home/home_details.dart';
import 'package:lit_hackathon_team_scale/widgets/call_to_action/call_to_action.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        HomeDetails(),
        Expanded(
          child: Center(
            child: CallToAction('Login'),
          ),
        )
      ],
    );
  }
}
