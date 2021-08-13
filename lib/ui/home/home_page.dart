import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/ui/home/home_content/home_content_desktop.dart';
import 'package:lit_hackathon_team_scale/ui/home/home_content/home_content_mobile.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/navigation_bar/navigation_bar.dart';
import 'package:lit_hackathon_team_scale/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:lit_hackathon_team_scale/widgets/list_view_variables.dart';
import 'package:lit_hackathon_team_scale/controllers/var_change_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_markdown/flutter_markdown.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key); //can add back the const later
  final VarChangeController c = Get.put(VarChangeController());
  QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,
        body: CenteredView(
          child: Column(
            children: [
              Obx(() => Expanded(child: Markdown(data: c.text.value))),
              Obx(() => Text(c.text.value)),
              Obx(() => ListViewVariables(c.findVars(c.text.value))),
              QuillToolbar.basic(controller: _controller),
              Expanded(
                child: Container(
                  child: QuillEditor.basic(
                    controller: _controller,
                    readOnly: false, // true for view only mode
                  ),
                ),
              ),
              ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    // update the text;
                    print(c.results.value.toString());
                    c.setText(_controller.document.toDelta().toString());
                  }),
              NavigationBar(),
              Expanded(
                child: ScreenTypeLayout(
                  mobile: HomeContentMobile(),
                  desktop: HomeContentDesktop(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
