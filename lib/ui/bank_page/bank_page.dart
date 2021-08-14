import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/config/ui_helpers.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';

class BankPage extends StatelessWidget {
  final TextEditingController _identifierTextController =
      TextEditingController();

  BankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    Widget _buildSection({
      required Color cardColour,
      required String header,
      required String description,
      required String hintText,
      required TextEditingController textEditingController,
      required TextInputType textInputType,
    }) {
      return Container(
        height: _mediaQuery.size.height * 0.3,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          color: cardColour,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  header,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            Center(
              child: TextFormField(
                controller: textEditingController,
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 50.0,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 50.0,
                  color: Colors.white,
                ),
              ),
            ),
            verticalSpaceMedium,
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Portal'),
      ),
      body: CenteredView(
        child: ListView(
          children: [
            SizedBox(height: _mediaQuery.size.height * 0.02),
            _buildSection(
              cardColour: Colors.blue,
              header: 'Identifier',
              description:
                  'Enter the identifier that your law firm has given you',
              hintText: 'xxxxxx',
              textEditingController: _identifierTextController,
              textInputType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
