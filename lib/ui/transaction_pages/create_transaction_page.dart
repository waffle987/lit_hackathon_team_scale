import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/controllers/transaction_controller.dart';
import 'package:lit_hackathon_team_scale/models/Question.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/elongated_button.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/input_fields/text_form_field.dart';

class CreateTransactionPage extends StatelessWidget {
  final TextEditingController _identifierTextController =
      TextEditingController();

  CreateTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransactionController c = Get.put(TransactionController());

    final ThemeData _themeData = Theme.of(context);
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
              textEditingController: c.nameTextController,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            CustomTextFormField(
              header: 'Message for the Bank',
              hintText: '',
              textEditingController: c.bodyTextController,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            Text(
              'Selected Questions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            Obx(() => c.selectedQuestions.value == null
                ? Container()
                : Container(
                    height: _mediaQuery.size.height / 2,
                    child: ReorderableListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      itemCount: c.selectedQuestions.value!.length,
                      itemBuilder: (_, index) {
                        print("WAT THE FUCK");
                        return Card(
                            key: Key('$index'),
                            child: ListTile(
                              title: Text(
                                  c.selectedQuestions.value![index].question),
                              subtitle: Text(c.selectedQuestions.value![index]
                                      .yesTitle +
                                  '\n' +
                                  c.selectedQuestions.value![index].noTitle),
                              leading: IconButton(
                                  icon: new Icon(Icons.delete,
                                      color: Colors.redAccent),
                                  onPressed: () {
                                    c.removeQuestion(
                                        c.selectedQuestions.value![index].id!);
                                  }),
                            ));
                      },
                      onReorder: (oldIndex, newIndex) {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final Question item =
                            c.selectedQuestions.value!.removeAt(oldIndex);
                        c.selectedQuestions.value!.insert(newIndex, item);
                      },
                    ),
                  )),
            SizedBox(height: _mediaQuery.size.height * 0.02),
            Text(
              'All Questions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Obx(() => Container(
                height: _mediaQuery.size.height / 2,
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: c.allQuestions.value!.length,
                  itemBuilder: (_, index) {
                    return Card(
                      child: CheckboxListTile(
                          value: c.isSelected(c.allQuestions.value![index]),
                          title: Text(c.allQuestions.value![index].question),
                          subtitle: Text('Yes' +
                              c.allQuestions.value![index].yesTitle +
                              '\n' +
                              'No' +
                              c.allQuestions.value![index].noTitle),
                          onChanged: (bool? newVal) {
                            if (newVal!) {
                              List<Question> selQ = c.selectedQuestions.value!;
                              if (selQ.asMap().containsKey(index)) {
                                c.selectedQuestions.value!.removeAt(index);
                                c.selectedQuestions.value!.insert(
                                    index, c.allQuestions.value![index]);
                              } else {
                                c.selectedQuestions.value!.insert(
                                    index, c.allQuestions.value![index]);
                              }
                            }
                            print('selectd q ' +
                                c.selectedQuestions.value.toString());
                            print(c.selectedQuestions.value!
                                .contains(c.allQuestions.value![index]));
                          }),
                    );
                  },
                ))),
            ElongatedButton(
              text: 'Create Block',
              onPressed: () {
                if (c.nameTextController.text == "") {
                  print("input a title");
                } else if (c.bodyTextController.text == "") {
                  print("input a body");
                } else {
                  c.setTransaction();
                  c.nameTextController.text = '';
                  c.bodyTextController.text = '';
                  c.selectedQuestions.value = [];
                  Get.back();
                }
              },
              buttonColour: Colors.greenAccent,
              textColour: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
