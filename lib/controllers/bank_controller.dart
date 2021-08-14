import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/models/transaction_model.dart';

class BankController extends GetxController {
  Rxn<TransactionModel?> transaction = Rxn<TransactionModel?>();

  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection('transactions');

  void getTransaction({required String identifier}) async {
    var transactionDocumentSnapshot = await _userCollectionReference
        .where("identifier", isEqualTo: identifier)
        .get();

    if (transactionDocumentSnapshot.docs.isNotEmpty) {
      transaction.value = TransactionModel.fromDocument(
          doc: transactionDocumentSnapshot.docs[0]);
    }
  }
}
