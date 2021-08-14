import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/input_fields/text_form_field.dart';

class CreateTransactionPage extends StatelessWidget {
  final TextEditingController _identifierTextController =
      TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _bodyTextController = TextEditingController();

  CreateTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: CenteredView(
        child: ListView(
          children: [
            Text(
              'Create a transaction',
              style: TextStyle(
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            CustomTextFormField(
              header: 'Identifier (For Bank Access)',
              hintText:
                  'Enter a code for the bank to use to access the document..',
              textEditingController: _identifierTextController,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            CustomTextFormField(
              header: 'Name of Transaction',
              hintText: '',
              textEditingController: _nameTextController,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            CustomTextFormField(
              header: 'Message for the Bank',
              hintText: '',
              textEditingController: _bodyTextController,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            Text(
              'Confirmed Blocks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            Text(
              'Pending Blocks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
