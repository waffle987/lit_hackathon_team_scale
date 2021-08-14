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

    return Scaffold(
      body: Obx(() {
        _bankController.getBlock(blockId: blockId);

        return CenteredView(
          child: Column(
            children: [
              Text(_bankController.currentBlock.value!.title),
              ListViewVariables(
                c.findVars(_bankController.currentBlock.value!.body),
              ),
            ],
          ),
        );
      }),
    );
  }
}
