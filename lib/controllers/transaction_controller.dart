import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/models/Question.dart';
import 'package:lit_hackathon_team_scale/models/transaction_model.dart';

class TransactionController extends GetxController {
  Rxn<List<Question>> selectedQuestions = Rxn<List<Question>>([]);
  Rxn<List<Question>> allQuestions = Rxn<List<Question>>([]);
  Rxn<List<TransactionModel>> trans = Rxn<List<TransactionModel>>([]);

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController bodyTextController = TextEditingController();
  @override
  void onReady() async {
    super.onReady();
  }

  void onInit() {
    allQuestions.bindStream(getQuestions());
    trans.bindStream(getTransactions());

    super.onInit();
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
    for (Question q in selectedQuestions.value!) {
      if (q.id == id) {
        selectedQuestions.value!.removeAt(i);
        return;
      }
      i++;
    }
  }

  setTransaction() {
    Map<String, dynamic> dbQuestions = {};
    for (Question q in selectedQuestions.value!) {
      dbQuestions[q.question] = [q.yesBlockId, q.noBlockId];
    }
    const id = 'wat'; //TODO: create identifier Ben
    _firestore.collection('transaction').add({
      'identifier': id,
      'name': nameTextController.text,
      'body': bodyTextController.text,
      'questions': dbQuestions,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  updatee() {
    update();
  }

  isSelected(Question q) {
    for (Question sq in selectedQuestions.value!) {
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
    _firestore.collection('transactions').doc(transactions.identifier).delete();
  }
}
