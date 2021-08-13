import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/ui/authentication/sign_in_page.dart';
import 'package:lit_hackathon_team_scale/widgets/call_to_action/call_to_action_mobile.dart';
import 'package:lit_hackathon_team_scale/widgets/call_to_action/call_to_action_tablet_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CallToAction extends StatelessWidget {
  final String title;
  CallToAction(this.title);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: GestureDetector(
          onTap: () => Get.to(() => SignInPage()),
          child: CallToActionMobile(title)),
      tablet: GestureDetector(
          onTap: () => Get.to(() => SignInPage()),
          child: CallToActionTabletDesktop(title)),
    );
  }
}
