import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionQuestionModel {
  final String question;
  final String yesId;
  final String noId;

  TransactionQuestionModel({
    required this.question,
    required this.yesId,
    required this.noId,
  });

  factory TransactionQuestionModel.fromDocument(
      {required DocumentSnapshot doc}) {
    return TransactionQuestionModel(
      question: doc['question'],
      yesId: doc['yesId'],
      noId: doc['noId'],
    );
  }
}
