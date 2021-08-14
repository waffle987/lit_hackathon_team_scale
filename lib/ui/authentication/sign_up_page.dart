import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/config/ui_helpers.dart';
import 'package:lit_hackathon_team_scale/controllers/auth_controller.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/busy_button.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';
import 'package:lit_hackathon_team_scale/widgets/input_fields/input_field.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    final AuthController _authController = AuthController.to;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: _themeData.scaffoldBackgroundColor,
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.8),
        ),
      ),
      body: CenteredView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Hero(
                      tag: 'logo',
                      transitionOnUserGestures: true,
                      child: CircleAvatar(
                        // backgroundImage: AssetImage(Assets.logo),
                        radius: 40.0,
                      ),
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
                  title: 'Sign Up',
                  onTap: () {
                    _authController.registerWithEmailAndPassword(context);
                  },
                  color: Colors.orange.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
