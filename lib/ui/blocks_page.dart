import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/elongated_button.dart';

class BlocksPage extends StatelessWidget {
  const BlocksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          ElongatedButton(
            text: 'Create Block',
            onPressed: () {},
            buttonColour: _themeData.primaryColor,
            textColour: Colors.white,
          ),
        ],
      ),
    );
  }
}
