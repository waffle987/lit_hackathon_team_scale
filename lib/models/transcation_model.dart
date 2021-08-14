import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String name;
  final String body;
  final String identifier;
  final Map<String, dynamic> confirmedBlocks;
  final Map<String, dynamic> pendingBlocks;

  TransactionModel({
    required this.name,
    required this.body,
    required this.identifier,
    required this.confirmedBlocks,
    required this.pendingBlocks,
  });

  factory TransactionModel.fromDocument({required DocumentSnapshot doc}) {
    return TransactionModel(
      name: doc['name'],
      body: doc['body'],
      identifier: doc['identifier'],
      confirmedBlocks: doc['confirmedBlocks'],
      pendingBlocks: doc['pendingBlocks'],
    );
  }
}
