import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/models/Question.dart';
import 'package:lit_hackathon_team_scale/models/transaction_model.dart';

class TransactionController extends GetxController {
  Rx<List<Question>> selectedQuestions = new Rx<List<Question>>([]);
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController bodyTextController = TextEditingController();
  final TextEditingController identifierTextController =
      TextEditingController();
  Rx<List<Question>> allQuestions = new Rx<List<Question>>([]);
  Rx<List<TransactionModel>> trans = new Rx<List<TransactionModel>>([]);
  Rx<List<int>> order = new Rx<List<int>>([]);

  @override
  void onReady() async {
    super.onReady();
  }

  void onInit() {
    allQuestions.bindStream(getQuestions());
    trans.bindStream(getTransactions());
  }

  @override
  void onClose() {
    super.onClose();
  }

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

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

  void removeQuestion(String id) {
    var i = 0;
    for (Question q in selectedQuestions.value) {
      if (q.id == id) {
        selectedQuestions.value.removeAt(i);
        selectedQuestions.refresh();
        allQuestions.refresh();
        return;
      }
      i++;
    }
  }

  setTransaction() {
    Map<String, dynamic> dbQuestions = {};
    for (Question q in selectedQuestions.value) {
      print('question to set' + q.question);
      dbQuestions[q.question] = [q.yesBlockId, q.noBlockId];
    }

    _firestore.collection('transactions').add({
      'identifier': identifierTextController.text,
      'name': nameTextController.text,
      'body': bodyTextController.text,
      'questions': dbQuestions,
      'user': _auth.currentUser!.uid,
      'order': order.value,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  isSelected(Question q) {
    for (Question sq in selectedQuestions.value) {
      if (sq.id == q.id) {
        return true;
      }
    }
    return false;
  }

  Stream<List<TransactionModel>> getTransactions() {
    return _firestore
        .collection('transactions')
        .where('user', isEqualTo: _auth.currentUser!.uid)
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((snap) {
      List<TransactionModel> retVal = [];
      if (snap.docs.isEmpty) {
        return retVal;
      } else {
        snap.docs.forEach((e) {
          retVal.add(TransactionModel.fromDocument(doc: e));
        });
      }
      return retVal;
    });
  }

  deleteTransaction(TransactionModel transactions) {
    _firestore
        .collection('transactions')
        .where('identifier', isEqualTo: transactions.identifier)
        .get()
        .then((QuerySnapshot snap) {
      snap.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }
}
