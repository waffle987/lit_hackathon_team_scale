import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:lit_hackathon_team_scale/config/ui_helpers.dart';
import 'package:lit_hackathon_team_scale/controllers/auth_controller.dart';
import 'package:lit_hackathon_team_scale/ui/authentication/reset_password_page.dart';
import 'package:lit_hackathon_team_scale/ui/authentication/sign_up_page.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/busy_button.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/input_field.dart';
import 'package:lit_hackathon_team_scale/widgets/text_link.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final AuthController _authController = AuthController.to;

    return Scaffold(
      backgroundColor: _themeData.scaffoldBackgroundColor,
      body: CenteredView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: _mediaQuery.size.height * 0.08),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  transitionOnUserGestures: true,
                  child: CircleAvatar(
                    // backgroundImage: AssetImage(Assets.logo),
                    radius: 120.0,
                  ),
                ),
                verticalSpaceTiny,
                Text(
                  'Welcome to RoboDoc',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                verticalSpaceLarge,
                InputField(
                  placeholder: 'Email',
                  controller: _authController.emailTextController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Password',
                  password: true,
                  controller: _authController.passwordTextController,
                ),
                verticalSpaceMedium,
                BusyButton(
                  title: 'Sign in',
                  busy: false,
                  onTap: () =>
                      _authController.signInWithEmailAndPassword(context),
                  color: Colors.orange.shade400,
                ),
                verticalSpaceMedium,
                TextLink(
                  text: 'Create an Account',
                  onPressed: () => Get.to(SignUpPage()),
                  color: kcMediumGreyColour,
                ),
                verticalSpaceSmall,
                Text(
                  'or',
                  style: TextStyle(color: Colors.white),
                ),
                verticalSpaceSmall,
                TextLink(
                  text: 'Forgot password?',
                  onPressed: () => Get.to(ResetPasswordPage()),
                  color: kcMediumGreyColour,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
