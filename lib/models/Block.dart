import 'package:cloud_firestore/cloud_firestore.dart';

class Block {
  final String text;
  final String? id;
  final Timestamp? createdAt;
  final List<String> vars;

  Block({required this.text, this.id, required this.vars, this.createdAt});

  factory Block.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return Block(
      id: doc.id,
      text: data['text'],
      vars: data['vars'],
      createdAt: data['createdAt'],
    );
  }
}
