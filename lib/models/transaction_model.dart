import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String name;
  final String body;
  final String identifier;
  final Map<String, dynamic> questions;

  TransactionModel({
    required this.name,
    required this.body,
    required this.identifier,
    required this.questions,
  });

  factory TransactionModel.fromDocument({required DocumentSnapshot doc}) {
    return TransactionModel(
      name: doc['name'],
      body: doc['body'],
      identifier: doc['identifier'],
      questions: doc['questions'],
    );
  }
}
