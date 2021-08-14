import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/elongated_button.dart';
import 'package:lit_hackathon_team_scale/widgets/input_fields/editable_text_field.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/controllers/block_controller.dart';
import 'package:lit_hackathon_team_scale/models/Block.dart';

// ignore: must_be_immutable
class EditBlockPage extends StatelessWidget {
  EditBlockPage({Key? key, required this.block}) : super(key: key);
  final BlockController c = Get.put(BlockController());
  late Block block;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: _mediaQuery.size.height * 0.02),
          EditableTextFormField(
              header: "Title",
              hintText: 'Write here...',
              textEditingController: c.editTitleTextController,
              initialText: block.title,
              textInputType: TextInputType.text),
          SizedBox(height: _mediaQuery.size.height * 0.02),
          EditableTextFormField(
              header: "Body",
              hintText: 'Write here...',
              textEditingController: c.editBodyTextController,
              initialText: block.body,
              textInputType: TextInputType.multiline),
          SizedBox(height: _mediaQuery.size.height * 0.05),
          ElongatedButton(
            text: 'Edit Block',
            onPressed: () {
              if (c.editTitleTextController.text == "") {
                print("input a title");
              } else if (c.editBodyTextController.text == "") {
                print("input a body");
              } else {
                c.updateBlock(block.id!);
                Get.back();
              }
            },
            buttonColour: _themeData.primaryColor,
            textColour: Colors.white,
          ),
        ],
      ),
    );
  }
}
