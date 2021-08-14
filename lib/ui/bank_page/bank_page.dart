import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/config/ui_helpers.dart';
import 'package:lit_hackathon_team_scale/controllers/bank_controller.dart';
import 'package:lit_hackathon_team_scale/controllers/var_change_controller.dart';
import 'package:lit_hackathon_team_scale/ui/bank_page/bank_text_page.dart';
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
    final VarChangeController _varChangeController =
        Get.put(VarChangeController());

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
              if (_identifierTextController.text.isNotEmpty) {
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
      return ListView(
        children: [
          SizedBox(height: _mediaQuery.size.height * 0.02),
          Text(
            _bankController.transaction.value!.name,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: _mediaQuery.size.height * 0.02),
          Text(
            _bankController.transaction.value!.body,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: _mediaQuery.size.height * 0.02),
          _bankController.transactionQuestionList.value == null
              ? Container()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      _bankController.transactionQuestionList.value!.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ListTile(
                      leading: ElongatedButton(
                        text: 'No',
                        onPressed: () => Get.to(() => BankTextPage(
                            blockId: _bankController
                                .transactionQuestionList.value![index].noId)),
                        buttonColour: Colors.red,
                        textColour: Colors.white,
                      ),
                      title: Text(
                        _bankController
                            .transactionQuestionList.value![index].question,
                        textAlign: TextAlign.center,
                      ),
                      trailing: ElongatedButton(
                        text: 'Yes',
                        onPressed: () => Get.to(() => BankTextPage(
                            blockId: _bankController
                                .transactionQuestionList.value![index].yesId)),
                        buttonColour: Colors.green,
                        textColour: Colors.white,
                      ),
                    ),
                  ),
                ),
          SizedBox(height: _mediaQuery.size.height * 0.02),
          Text('Blocks', style: TextStyle(fontSize: 20)),
          Obx(() {
            return SizedBox(
                height: _mediaQuery.size.height / 2,
                child: _varChangeController.list.length == 0
                    ? Container()
                    : ListView.builder(
                        itemCount: _varChangeController.list.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                              title: Text(
                                _varChangeController.list[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                              leading: IconButton(
                                  icon: Icon(Icons.delete,
                                      color: Colors.redAccent),
                                  onPressed: () {
                                    _varChangeController.list.removeAt(index);
                                  }));
                        }));
          }),
          ElongatedButton(
            text: 'Download PDF',
            onPressed: () {
              _varChangeController.createPDF();
            },
            buttonColour: Colors.green,
            textColour: Colors.white,
          ),
        ],
      );
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
