import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/controllers/var_change_controller.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/list_view_variables.dart';

class Bank extends StatelessWidget {
  const Bank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VarChangeController c = Get.put(VarChangeController());

    return Scaffold(
      body: CenteredView(
        child: Column(
          children: [
            Obx(() => Text(c.text.value)),
            Obx(() => ListViewVariables(c.findVars(c.text.value))),
          ],
        ),
      ),
    );
  }
}
