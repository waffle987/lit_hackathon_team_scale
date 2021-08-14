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
      body: Stack(
        children: [Positioned.fill(
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
              child: Padding(
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
                      children: <Widget>[
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
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
            ),
          ),
        ),],
      ),
    );
  }
}
