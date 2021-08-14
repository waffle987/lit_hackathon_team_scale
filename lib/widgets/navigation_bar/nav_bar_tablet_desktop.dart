import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/ui/bank_page/bank_page.dart';
import 'package:lit_hackathon_team_scale/ui/team_page/team_page.dart';
import 'package:lit_hackathon_team_scale/widgets/navigation_bar/nav_bar_item.dart';
import 'package:lit_hackathon_team_scale/widgets/navigation_bar/nav_bar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(width: 60),
              GestureDetector(
                onTap: () => Get.to(() => BankPage()),
                child: NavBarItem('Banks'),
              ),
              const SizedBox(width: 60),
              GestureDetector(
                onTap: () => Get.to(() => TeamPage()),
                child: NavBarItem('Team'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
