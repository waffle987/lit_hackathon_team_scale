import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/models/Question.dart';
import 'package:lit_hackathon_team_scale/models/Answer.dart';

class QnAController extends GetxController {
  // final TextEditingController ansTextController = TextEditingController();
  final TextEditingController quesTextController = TextEditingController();
  final Rx<String> yesBlockId = ''.obs;
  final Rx<String> noBlockId = ''.obs;
  final Rx<String> yesTitle = ''.obs;
  final Rx<String> noTitle = ''.obs;
  final Rx<List<Question>> questions = new Rx<List<Question>>([]);

  @override
  void onReady() async {
    super.onReady();
  }

  void onInit() {
    questions.bindStream(getQuestions());
  }

  @override
  void onClose() {
    super.onClose();
  }

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> setQuestion() async {
    final docRef = await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('questions')
        .add({
      'question': quesTextController.text,
      'yesBlockId': yesBlockId.value,
      'noBlockId': noBlockId.value,
      'noTitle': noTitle.value,
      'yesTitle': yesTitle.value,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  void deleteQuestion(Question q) {
    _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('questions')
        .doc(q.id)
        .delete();
  }

  Stream<List<Question>> getQuestions() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('questions')
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((snap) {
      List<Question> retVal = [];
      if (snap.docs.isEmpty) {
        return retVal;
      } else {
        snap.docs.forEach((e) {
          retVal.add(Question.fromFirestore(e));
        });
      }
      return retVal;
    });
  }
}
