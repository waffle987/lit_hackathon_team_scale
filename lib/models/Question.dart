import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String? id;
  final Timestamp? createdAt;
  final String question;
  final String yesBlockId;
  final String noBlockId;
  final String yesTitle;
  final String noTitle;

  Question(
      {this.id,
      this.createdAt,
      required this.question,
      required this.yesBlockId,
      required this.noBlockId,
      required this.yesTitle,
      required this.noTitle});

  factory Question.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return Question(
        id: doc.id,
        question: data['question'],
        createdAt: data['createdAt'],
        yesBlockId: data['yesBlockId'],
        noBlockId: data['noBlockId'],
        yesTitle: data['yesTitle'],
        noTitle: data['noTitle']);
  }
}
