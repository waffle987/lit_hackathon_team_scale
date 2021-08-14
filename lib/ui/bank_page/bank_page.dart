import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/config/ui_helpers.dart';
import 'package:lit_hackathon_team_scale/controllers/bank_controller.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/elongated_button.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';

class BankPage extends StatelessWidget {
  final TextEditingController _identifierTextController =
      TextEditingController();

  BankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    /// GetX controllers
    final BankController _bankController = Get.put(BankController());

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

    Widget _buildIdentifierPage() {
      return ListView(
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
          SizedBox(height: _mediaQuery.size.height * 0.02),
          ElongatedButton(
            text: 'Enter',
            onPressed: () {
              if (_identifierTextController.text.isNotEmpty &&
                  _bankController.transaction.value != null) {
                _bankController.getTransaction(
                    identifier: _identifierTextController.text);

                Get.snackbar(
                  'Success'.tr,
                  'You have entered a valid identifier!',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 5),
                  backgroundColor: Colors.green,
                  colorText: Get.theme.snackBarTheme.actionTextColor,
                );
              } else {
                Get.snackbar(
                  'Unsuccessful'.tr,
                  'You have entered an incorrect identifier. Please try again!',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 5),
                  backgroundColor: Colors.red,
                  colorText: Get.theme.snackBarTheme.actionTextColor,
                );
              }
            },
            buttonColour: Colors.green,
            textColour: Colors.white,
          ),
        ],
      );
    }

    Widget _buildTransactionPage() {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Portal'),
      ),
      body: Obx(
        () => CenteredView(
          child: _bankController.transaction.value == null
              ? _buildIdentifierPage()
              : _buildTransactionPage(),
        ),
      ),
    );
  }
}
