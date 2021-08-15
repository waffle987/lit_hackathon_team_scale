import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/elongated_button.dart';
import 'package:lit_hackathon_team_scale/widgets/input_fields/text_form_field.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/controllers/qna_controller.dart';
import 'package:lit_hackathon_team_scale/controllers/block_controller.dart';
import 'package:lit_hackathon_team_scale/models/Question.dart';
import 'package:lit_hackathon_team_scale/models/Answer.dart';
import 'package:lit_hackathon_team_scale/ui/blocks_page/blocks_page.dart';

// ignore: must_be_immutable
class QnAPage extends StatelessWidget {
  QnAPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late TabController _tabController;
    final QnAController c = Get.put(QnAController());
    final BlockController c2 = Get.put(BlockController());

    final ThemeData _themeData = Theme.of(context);
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: _mediaQuery.size.height * 0.02),
          CustomTextFormField(
              header: "Question",
              hintText: 'Write here...',
              textEditingController: c.quesTextController,
              textInputType: TextInputType.text),
          SizedBox(height: _mediaQuery.size.height * 0.02),
          Text("Assign Blocks",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
          SizedBox(height: _mediaQuery.size.height * 0.02),
          TabBar(tabs: <Widget>[
            Tab(child: Text('Yes')),
            Tab(child: Text('No')),
          ]),
          SizedBox(
              height: _mediaQuery.size.height / 4,
              child: TabBarView(children: <Widget>[
                ListView.builder(
                    itemBuilder: (_, index) {
                      return Obx(() => CheckboxListTile(
                          value: c.yesBlockId.value != '' &&
                              c.yesBlockId.value ==
                                  c2.blockList.value[index].id,
                          title: Text(c2.blockList.value[index].title),
                          subtitle: Text(c2.blockList.value[index].body),
                          onChanged: (bool? newVal) {
                            if (newVal!) {
                              c.yesBlockId.value =
                                  c2.blockList.value[index].id!;
                              c.yesTitle.value =
                                  c2.blockList.value[index].title;
                            } else {
                              c.yesBlockId.value = '';
                            }
                          }));
                    },
                    itemCount: c2.blockList.value.length),
                ListView.builder(
                    itemBuilder: (_, index) {
                      return Obx(() => CheckboxListTile(
                          value: c.noBlockId.value != '' &&
                              c.noBlockId.value == c2.blockList.value[index].id,
                          title: Text(c2.blockList.value[index].title),
                          subtitle: Text(c2.blockList.value[index].body),
                          onChanged: (bool? newVal) {
                            if (newVal!) {
                              c.noBlockId.value = c2.blockList.value[index].id!;
                              c.noTitle.value = c2.blockList.value[index].title;
                            } else {
                              c.noBlockId.value = '';
                            }
                          }));
                    },
                    itemCount: c2.blockList.value.length),
              ])),
          SizedBox(height: _mediaQuery.size.height * 0.05),
          ElongatedButton(
            text: 'Create Question',
            onPressed: () async {
              if (c.quesTextController.text == "") {
                print("input a question");
                Get.snackbar(
                  "Question".tr,
                  "Question can't be empty!".tr,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 7),
                  backgroundColor: Colors.red,
                  colorText: Get.theme.snackBarTheme.actionTextColor,
                );
              } else if (c.yesBlockId.value == "") {
                Get.snackbar(
                  "Choose a yes block!".tr,
                  "".tr,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 7),
                  backgroundColor: Colors.red,
                  colorText: Get.theme.snackBarTheme.actionTextColor,
                );
                print("choose a yes block");
              } else if (c.noBlockId.value == "") {
                print("choose a no block");
                Get.snackbar(
                  "Choose a no block!".tr,
                  "".tr,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 7),
                  backgroundColor: Colors.red,
                  colorText: Get.theme.snackBarTheme.actionTextColor,
                );
              } else {
                await c.setQuestion();
                c.quesTextController.text = '';
                c.noBlockId.value = '';
                c.yesBlockId.value = '';
              }
            },
            buttonColour: _themeData.primaryColor,
            textColour: Colors.white,
          ),
          SizedBox(height: _mediaQuery.size.height * 0.02),
          Text(
            'Questions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: _mediaQuery.size.height * 0.02),
          SizedBox(
            height: _mediaQuery.size.height / 2,
            child: (GetX<QnAController>(
                init: Get.put(QnAController()),
                builder: (QnAController c) {
                  if (c.questions.value.length != 0) {
                    return Container(
                        height: _mediaQuery.size.height,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: c.questions.value.length,
                          itemBuilder: (_, index) {
                            return Card(
                                key: Key('$index'),
                                child: ListTile(
                                    title:
                                        Text(c.questions.value[index].question),
                                    subtitle: Text('Yes: ' +
                                        c.questions.value[index].yesTitle +
                                        ' No: ' +
                                        c.questions.value[index].noTitle),
                                    leading: Expanded(
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            IconButton(
                                                icon: new Icon(Icons.edit,
                                                    color: Colors.blueAccent),
                                                onPressed: () {
                                                  // Get.to(() => EditBlockPage(
                                                  //     block: c.blockList
                                                  //         .value[index]));
                                                  //TODO: Edit Question page
                                                }),
                                            IconButton(
                                                icon: new Icon(Icons.delete,
                                                    color: Colors.redAccent),
                                                onPressed: () {
                                                  c.deleteQuestion(
                                                      c.questions.value[index]);
                                                }),
                                          ]),
                                    )));
                          },
                        ));
                  } else {
                    return Text('Loading...');
                  }
                })),
          )
        ]),
      ),
    );
  }
}
