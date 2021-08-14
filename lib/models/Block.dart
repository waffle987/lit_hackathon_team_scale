import 'package:cloud_firestore/cloud_firestore.dart';

class Block {
  final String body;
  final String? id;
  final Timestamp? createdAt;
  // final List<String> vars;
  final String title;

  Block(
      {required this.body,
      this.id,
      // required this.vars,
      this.createdAt,
      required this.title});

  factory Block.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return Block(
      id: doc.id,
      body: data['body'],
      // vars: data['vars'],
      title: data['title'],
      createdAt: data['createdAt'],
    );
  }
}
