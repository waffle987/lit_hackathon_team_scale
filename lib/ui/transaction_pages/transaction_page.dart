import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/ui/transaction_pages/create_transaction_page.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/elongated_button.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: _mediaQuery.size.height * 0.02),
          ElongatedButton(
            text: 'Create Transaction',
            onPressed: () => Get.to(() => CreateTransactionPage()),
            buttonColour: _themeData.primaryColor,
            textColour: Colors.white,
          ),
        ],
      ),
    );
  }
}
