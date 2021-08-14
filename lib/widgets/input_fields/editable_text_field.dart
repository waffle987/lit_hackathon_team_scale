import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/config/ui_helpers.dart';

class EditableTextFormField extends StatelessWidget {
  final String header;
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final iconWithSizedBox;
  final String initialText;

  const EditableTextFormField({
    required this.header,
    required this.hintText,
    required this.textEditingController,
    required this.textInputType,
    required this.initialText,
    this.iconWithSizedBox,
  });

  @override
  Widget build(BuildContext context) {
    textEditingController.text = initialText;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            iconWithSizedBox == null ? Container() : iconWithSizedBox,
            Text(
              header,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15.0),
        Container(
          child: TextFormField(
            controller: textEditingController,
            keyboardType: textInputType,
            maxLines: null,
            decoration: kTextFieldInputDecoration.copyWith(
              hintText: hintText == '' ? 'Type here...' : hintText,
            ),
          ),
        ),
      ],
    );
  }
}
