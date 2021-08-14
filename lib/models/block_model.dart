import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionBlockModel {
  final String title;
  final String body;
  final String blockId;

  TransactionBlockModel({
    required this.title,
    required this.body,
    required this.blockId,
  });

  factory TransactionBlockModel.fromDocument({required DocumentSnapshot doc}) {
    return TransactionBlockModel(
      title: doc['title'],
      body: doc['body'],
      blockId: doc['blockId'],
    );
  }
}
