import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/controllers/var_change_controller.dart';
import 'package:get/get.dart';

class ListViewVariables extends StatelessWidget {
  final VarChangeController c = Get.put(VarChangeController());

  List<String> vars = [];
  ListViewVariables(this.vars);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          Text("Variable"),
          SizedBox(width: 50),
          Text("Value"),
          Obx(() => Text(c.results.toString()))
        ]),
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: vars.length,
          itemBuilder: (_, index) {
            return Container(
              height: 50,
              child: (Row(
                children: <Widget>[
                  Text(vars[index]),
                  SizedBox(width: 50),
                  Expanded(child: TextField(onChanged: (value) {
                    if (c.results.length < index + 1) {
                      c.results.insert(index, value);
                    } else {
                      c.results[index] = value;
                    }
                  }))
                ],
              )),
            );
          },
        ),
        ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              // update the text;
              print(c.results.value.toString());
              c.replaceVars(c.results);
            })
      ],
    );
  }
}
