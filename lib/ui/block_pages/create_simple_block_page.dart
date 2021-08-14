import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/input_fields/text_form_field.dart';

class CreateSimpleBlockPage extends StatelessWidget {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _bodyTextController = TextEditingController();

  CreateSimpleBlockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: CenteredView(
        child: ListView(
          children: [
            Text(
              'Create a Simple Block',
              style: TextStyle(
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            CustomTextFormField(
              header: 'Name of Block',
              hintText: '',
              textEditingController: _nameTextController,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            CustomTextFormField(
              header: 'Simple Block',
              hintText: '',
              textEditingController: _bodyTextController,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
