import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/elongated_button.dart';
import 'package:lit_hackathon_team_scale/widgets/input_fields/text_form_field.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/models/Block.dart';
import 'package:lit_hackathon_team_scale/controllers/block_controller.dart';
import 'package:lit_hackathon_team_scale/ui/blocks_page/edit_block_page.dart';

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
              header: "Body (Wrap your variables with {{ }})",
              hintText: 'e.g. Bob is {{variable_1}}...',
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
                c.bodyTextController.text = '';
                c.titleTextController.text = '';
              }
            },
            buttonColour: _themeData.primaryColor,
            textColour: Colors.white,
          ),
          SizedBox(height: _mediaQuery.size.height * 0.05),
          Text(
            'Blocks',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: _mediaQuery.size.height * 0.05),
          GetX<BlockController>(
              init: Get.put(BlockController()),
              builder: (BlockController c) {
                if (c.blockList.value.length != 0) {
                  return Container(
                      height: _mediaQuery.size.height,
                      child: ReorderableListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: c.blockList.value.length,
                          itemBuilder: (_, index) {
                            return Card(
                                key: Key('$index'),
                                child: ListTile(
                                    title: Text(c.blockList.value[index].title),
                                    subtitle:
                                        Text(c.blockList.value[index].body),
                                    leading: Container(
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            IconButton(
                                                icon: new Icon(Icons.edit,
                                                    color: Colors.grey),
                                                onPressed: () {
                                                  Get.to(() => EditBlockPage(
                                                      block: c.blockList
                                                          .value[index]));
                                                }),
                                            IconButton(
                                                icon: new Icon(Icons.delete,
                                                    color: Colors.redAccent),
                                                onPressed: () {
                                                  c.deleteBlock(
                                                      c.blockList.value[index]);
                                                }),
                                          ]),
                                    )));
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
