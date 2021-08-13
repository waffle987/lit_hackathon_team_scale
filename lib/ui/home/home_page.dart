import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/ui/home/home_details.dart';
import 'package:lit_hackathon_team_scale/widgets/call_to_action.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/navigation_bar.dart';
import 'package:lit_hackathon_team_scale/widgets/list_view_variables.dart';
import 'package:lit_hackathon_team_scale/controllers/var_change_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key); //can add back the const later
  final VarChangeController c = Get.put(VarChangeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenteredView(
        child: Column(
          children: [
            Obx(() => Text(c.text.value)),
            Obx(() => ListViewVariables(c.findVars(c.text.value))),
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
