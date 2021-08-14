import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/elongated_button.dart';
import 'package:lit_hackathon_team_scale/widgets/input_fields/text_form_field.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/models/Block.dart';
import 'package:lit_hackathon_team_scale/controllers/block_controller.dart';

class BlocksPage extends StatelessWidget {
  BlocksPage({Key? key}) : super(key: key);
  final BlockController c = Get.put(BlockController());

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: _mediaQuery.size.height * 0.02),
          CustomTextFormField(
              header: "Title",
              hintText: 'Write here...',
              textEditingController: c.titleTextController,
              textInputType: TextInputType.text),
          SizedBox(height: _mediaQuery.size.height * 0.02),
          CustomTextFormField(
              header: "Body",
              hintText: 'Write here...',
              textEditingController: c.bodyTextController,
              textInputType: TextInputType.multiline),
          SizedBox(height: _mediaQuery.size.height * 0.05),
          ElongatedButton(
            text: 'Create Block',
            onPressed: () {
              if (c.titleTextController.text == "") {
                print("input a title");
              } else if (c.bodyTextController.text == "") {
                print("input a body");
              } else {
                c.setBlock();
              }
            },
            buttonColour: _themeData.primaryColor,
            textColour: Colors.white,
          ),
          SizedBox(height: _mediaQuery.size.height * 0.05),
          GetX<BlockController>(
              init: Get.put(BlockController()),
              builder: (BlockController c) {
                print(c);
                if (c != null && c.blockList.value.length != 0) {
                  return Container(
                      height: _mediaQuery.size.height,
                      child: ReorderableListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: c.blockList.value.length,
                          itemBuilder: (_, index) {
                            // return Column(children: <Widget>[
                            //   Text(c.blockList.value[index].title),
                            //   Text(c.blockList.value[index].body)
                            // ]);
                            return Card(
                              key: Key('$index'),
                              child: ListTile(
                                leading: FlutterLogo(size: 56.0),
                                title: Text(c.blockList.value[index].title),
                                subtitle: Text(c.blockList.value[index].body),
                                trailing: Icon(Icons.more_vert),
                              ),
                            );
                          },
                          onReorder: (oldIndex, newIndex) {
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }
                            final Block item =
                                c.blockList.value.removeAt(oldIndex);
                            c.blockList.value.insert(newIndex, item);
                          }));
                } else {
                  return Text('Loading...');
                }
              })
        ],
      ),
    );
  }
}
