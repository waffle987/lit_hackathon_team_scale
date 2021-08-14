import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/ui/transaction_pages/create_transaction_page.dart';
import 'package:lit_hackathon_team_scale/widgets/buttons/elongated_button.dart';
import 'package:lit_hackathon_team_scale/controllers/transaction_controller.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final TransactionController c = Get.put(TransactionController());
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
          SizedBox(height: _mediaQuery.size.height * 0.02),
          Text(
            'Transactions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: _mediaQuery.size.height * 0.02),
          SizedBox(
              height: _mediaQuery.size.height,
              child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    itemCount: c.trans.value.length,
                    itemBuilder: (_, index) {
                      return Card(
                          key: Key('$index'),
                          child: ListTile(
                            title: Text(c.trans.value[index].name),
                            subtitle: Text(c.trans.value[index].body),
                            leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                      icon: new Icon(Icons.edit,
                                          color: Colors.blueAccent),
                                      onPressed: () {
                                        // Get.to(() => EditBlockPage(
                                        //     block: c.blockList
                                        //         .value[index]));
                                        //TODO: Edit Question page
                                      }),
                                  IconButton(
                                      icon: new Icon(Icons.delete,
                                          color: Colors.redAccent),
                                      onPressed: () {
                                        //TODO: Create confirmation alert
                                        c.deleteTransaction(
                                            c.trans.value[index]);
                                      }),
                                ]),
                          ));
                    },
                  ))),
          SizedBox(height: _mediaQuery.size.height * 0.05)
        ],
      ),
    );
  }
}
