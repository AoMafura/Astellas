import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  static final Firestore _db = Firestore.instance;

  //-----------------------------------------------------
  //----------------------Methods------------------------
  //-----------------------------------------------------

  //-------------------Add Note-------------------
  static Future<void> addNote(Map<String,dynamic> note) async {
    await _db
      .collection('notes')
      .document()
      .setData(note)
      .catchError((e) {
      print(e);
    });
    return true;
  }

  //-------------------Edit Note------------------
  static Future<void> updateNote(String id, Map<String, dynamic> note) async {
    await _db
      .collection('notes')
      .document(id)
      .updateData(note)
      .catchError((e) { 
        print(e); 
      }
    );
    return true;
  }

  //-------------------Delete Note------------------
  static Future<void> deleteNote(String id) async {
    await _db.collection('notes')
      .document(id)
      .delete()
      .catchError((e) { 
        print(e); 
      }
    );
    return true;
  }

  //-------------------------------
}

  
