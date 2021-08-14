import 'package:cloud_firestore/cloud_firestore.dart';

class Answer {
  final String? id;
  final Timestamp? createdAt;
  final String questionId;
  final String blockId;
  final String answer;
  Answer(
      {this.id,
      required this.questionId,
      required this.answer,
      this.createdAt,
      required this.blockId});

  factory Answer.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return Answer(
        id: doc.id,
        questionId: data['questionId'],
        answer: data['answer'],
        blockId: data['blockId'],
        createdAt: data['createdAt']);
  }
}
