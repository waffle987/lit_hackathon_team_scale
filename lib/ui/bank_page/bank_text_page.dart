import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/controllers/bank_controller.dart';
import 'package:lit_hackathon_team_scale/controllers/var_change_controller.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/list_view_variables.dart';

class BankTextPage extends StatelessWidget {
  final String blockId;

  const BankTextPage({
    Key? key,
    required this.blockId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// GetX controllers
    final VarChangeController c = Get.put(VarChangeController());
    final BankController _bankController = BankController.to;

    c.abc(blockId: blockId);

    return Scaffold(
      body: CenteredView(
        child: Obx(() => _bankController.currentBlock.value == null
            ? Container()
            : Column(
                children: [
                  Text(_bankController.currentBlock.value!.title),
                  SizedBox(height: 20.0),
                  Text(c.text.value),
                  ListViewVariables(
                    c.findVars(c.text.value),
                  ),
                ],
              )),
      ),
    );
  }
}
