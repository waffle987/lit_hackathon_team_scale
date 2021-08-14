import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:lit_hackathon_team_scale/config/ui_helpers.dart';
import 'package:lit_hackathon_team_scale/controllers/auth_controller.dart';
import 'package:lit_hackathon_team_scale/ui/authentication/reset_password_page.dart';
import 'package:lit_hackathon_team_scale/ui/authentication/sign_up_page.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/busy_button.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/input_fields/input_field.dart';
import 'package:lit_hackathon_team_scale/widgets/text_link.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final AuthController _authController = AuthController.to;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 60,
                width: 60,
                child: Image(
                  image: AssetImage('black_logo.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            horizontalSpaceSmall,
            Text(
              'RoboDoc',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      backgroundColor: _themeData.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.grey.shade900,
                BlendMode.saturation,
              ),
              child: Image.asset(
                'background2.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          CenteredView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(350, 0, 350, 0),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: _mediaQuery.size.height * 0.0001,
                    bottom: _mediaQuery.size.height * 0.0001),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 50, 500),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        verticalSpaceTiny,
                        Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        verticalSpaceSmall,
                        Text(
                          'Sign in to continue',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black.withOpacity(0.8),
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
                          onTap: () => _authController
                              .signInWithEmailAndPassword(context),
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
            ),
          ),
        ],
      ),
    );
  }
}
