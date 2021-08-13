import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:lit_hackathon_team_scale/models/Block.dart';

class BlockAPI {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  void setBlock(Block block) {
    _firestore
        .collection('blocks')
        .add({
          'text': block.text,
          'vars': block.vars,
          'user': _auth.currentUser!.uid,
          'createdAt': FieldValue.serverTimestamp(),
        })
        .then((value) => print('Block added'))
        .catchError((error) => print("Failed to add block: $error"));
  }

  Stream<Block> getBlocks() {
    return _firestore
        .collection('blocks')
        .where('user', isEqualTo: _auth.currentUser!.uid)
        .snapshots()
        .map((snap) {
      if (snap.docs.isEmpty) {
        return Block(text: '', vars: []);
      } else {
        return Block.fromFirestore(snap.docs[0]);
      }
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
