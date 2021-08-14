import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/ui/unauth_home/home_content/home_content_desktop.dart';
import 'package:lit_hackathon_team_scale/ui/unauth_home/home_content/home_content_mobile.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/navigation_bar/navigation_bar.dart';
import 'package:lit_hackathon_team_scale/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class UnAuthHomePage extends StatelessWidget {
  UnAuthHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned.fill(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.grey,
                    BlendMode.saturation,
                  ),
                  child: Image.asset(
                    'background2.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              CenteredView(
                child: Column(
                  children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
