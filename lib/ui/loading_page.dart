import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/widgets/progress_indicators.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: circularProgressIndicator(context: context),
          ),
        ],
      ),
    );
  }
}
