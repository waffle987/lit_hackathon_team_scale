import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/ui/home/home_details.dart';
import 'package:lit_hackathon_team_scale/widgets/call_to_action.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenteredView(
        child: Column(
          children: [
            NavigationBar(),
            Expanded(
              child: Row(
                children: [
                  HomeDetails(),
                  Expanded(
                    child: Center(
                      child: CallToAction('Login'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
