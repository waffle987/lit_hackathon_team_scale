import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/models/transaction_model.dart';
import 'package:lit_hackathon_team_scale/models/transaction_question_model.dart';

class BankController extends GetxController {
  Rxn<TransactionModel?> transaction = Rxn<TransactionModel?>();

  Rxn<List<TransactionQuestionModel>> transactionQuestionList =
      Rxn<List<TransactionQuestionModel>>([]);

  final CollectionReference _transactionCollectionReference =
      FirebaseFirestore.instance.collection('transactions');
  final CollectionReference _blockCollectionReference =
      FirebaseFirestore.instance.collection('blocks');

  //  DocumentSnapshot<Map<String, dynamic>> doc =
  //      await _blockCollectionReference.doc(value).get()
  //          as DocumentSnapshot<Map<String, dynamic>>;
  //
  // Block _block =  Block.fromFirestore(doc);
  //

  void getTransaction({required String identifier}) async {
    var transactionDocumentSnapshot = await _transactionCollectionReference
        .where("identifier", isEqualTo: identifier)
        .get();

    if (transactionDocumentSnapshot.docs.isNotEmpty) {
      TransactionModel _transactionModel = TransactionModel.fromDocument(
          doc: transactionDocumentSnapshot.docs[0]);

      transaction.value = _transactionModel;

      _transactionModel.questions.forEach((key, value) {
        TransactionQuestionModel _transactionQuestionModel =
            TransactionQuestionModel(
          question: key,
          yesId: value[0],
          noId: value[1],
        );

        transactionQuestionList.value!.add(_transactionQuestionModel);
      });
    }
  }
}
