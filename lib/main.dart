import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/controllers/auth_controller.dart';
import 'package:lit_hackathon_team_scale/ui/auth_home/auth_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<AuthController>(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LIT Hack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthHomePage(),
    );
  }
}
