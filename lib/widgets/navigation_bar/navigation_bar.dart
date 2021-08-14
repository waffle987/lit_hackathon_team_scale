import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/widgets/navigation_bar/nav_bar_mobile.dart';
import 'package:lit_hackathon_team_scale/widgets/navigation_bar/nav_bar_tablet_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      tablet: NavigationBarTabletDesktop(),
    );
  }
}
