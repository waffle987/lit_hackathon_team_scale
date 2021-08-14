import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lit_hackathon_team_scale/models/Block.dart';

class BlockController extends GetxController {
  /// Text editing controllers
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController bodyTextController = TextEditingController();

  Rx<List<Block>> blockList = Rx<List<Block>>([]);

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onInit() {
    blockList.bindStream(getBlocks());
  }

  @override
  void onClose() {
    titleTextController.dispose();
    bodyTextController.dispose();
    super.onClose();
  }

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  void setBlock() {
    _firestore
        .collection('blocks')
        .add({
          'body': bodyTextController.text,
          // 'vars': vars,
          'title': titleTextController.text,
          'user': _auth.currentUser!.uid,
          'createdAt': FieldValue.serverTimestamp(),
        })
        .then((value) => print('Block added'))
        .catchError((error) => print("Failed to add block: $error"));
  }

  Stream<List<Block>> getBlocks() {
    print('getting blocks');
    return _firestore
        .collection('blocks')
        .where('user', isEqualTo: _auth.currentUser!.uid)
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((snap) {
      List<Block> retVal = [];
      if (snap.docs.isEmpty) {
        return retVal;
      } else {
        snap.docs.forEach((e) {
          retVal.add(Block.fromFirestore(e));
        });
      }
      for (var val in retVal) {
        print(val.title + ' Title');
      }
      print('auth ' + _auth.currentUser!.uid);
      return retVal;
    });
  }

  void deleteBlock(Block block) {
    _firestore
        .collection('blocks')
        .doc(block.id)
        .delete()
        .then((value) => print('Block deleted'))
        .catchError((error) => print('Failed to delete block: $error'));
  }
}
