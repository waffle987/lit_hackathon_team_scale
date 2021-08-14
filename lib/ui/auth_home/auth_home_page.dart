import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lit_hackathon_team_scale/controllers/auth_controller.dart';
import 'package:lit_hackathon_team_scale/ui/blocks_page/blocks_page.dart';
import 'package:lit_hackathon_team_scale/ui/logic_flow/create_qna_page.dart';
import 'package:lit_hackathon_team_scale/ui/transaction_pages/transaction_page.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/circle_button.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/pop_up_dialog.dart';

class AuthHomePage extends StatelessWidget {
  const AuthHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    /// GetX controllers
    final AuthController _authController = AuthController.to;

    /// Build User profile bubble tab bar
    Widget buildTabBar() {
      return TabBar(
        indicator: BubbleTabIndicator(
          indicatorColor: Theme.of(context).primaryColor,
          indicatorHeight: 30.0,
          indicatorRadius: 20.0,
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
        unselectedLabelColor: Colors.white38,
        labelColor: Colors.white,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        tabs: <Widget>[
          Tab(
            child: Text('Transactions'),
          ),
          Tab(
            child: Text('Blocks'),
          ),
          Tab(child: Text('Questions'))
        ],
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'RoboDoc',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            CircleButton(
              icon: FontAwesomeIcons.signOutAlt,
              function: () => showDialog(
                context: context,
                builder: (dialogContext) {
                  return popUpDialog(
                    dialogContext: dialogContext,
                    function: () => _authController.signOut(),
                    description: 'Log out?',
                    noColourButtonText: 'No',
                    colourButtonText: 'Yes',
                    buttonColour: Colors.red,
                    icon: const Icon(
                      FontAwesomeIcons.signOutAlt,
                      color: Colors.white,
                      size: 50.0,
                    ),
                    circularImageColour: Colors.red,
                  );
                },
              ),
              buttonColour: Colors.red,
              iconColour: Colors.white,
            ),
            SizedBox(width: _mediaQuery.size.width * 0.03),
          ],
        ),
        body: CenteredView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: _mediaQuery.size.height * 0.06,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: _mediaQuery.size.width * 0.05),
                child: buildTabBar(),
              ),
              Expanded(
                child: TabBarView(
                  children: [TransactionPage(), BlocksPage(), QnAPage()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
