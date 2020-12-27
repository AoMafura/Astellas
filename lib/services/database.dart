import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:midterm_project/models/note.dart';
import 'package:midterm_project/note_tile.dart';
import 'dart:async';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  //collection reference
  static final Firestore _db = Firestore.instance;

  final CollectionReference notesCollection =
      Firestore.instance.collection('notes');

  Future updateUserData(
      String username, String question, String answer) async {
    return await notesCollection.document(uid).setData({
      'answer': answer,
      'question': question,
      'username': username,
    });
  }

  //note list from snapshot
  List<Note> _noteListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Note(
        username: doc.data['username'] ?? '',
        question: doc.data['question'] ?? '',
        answer: doc.data['answer'] ?? '',
      );
    }).toList();
  }

  //get notes stream
  Stream<List<Note>> get notes {
    return notesCollection.snapshots().map(_noteListFromSnapshot);
  }

  //-------------------Add Note-----------------
  static Future<void> addNote(Map<String,dynamic> note) async {
    await _db
      .collection('notes')
      .document()
      .setData(note);
  }

  //-------------------Edit Note------------------
  static Future<void> updateNote(String id, Map<String, dynamic> note) async {
    await _db
      .collection('notes').
      document(id)
      .updateData(note)
      .catchError((e) {
      print(e);
    });
    return true;
  }

  //-------------------Delete Note------------------
  static Future<void> deleteNote(String id) async {
    await _db.collection('notes')
      .document(id)
      .delete().
      catchError((e) {
      print(e);
    });
    return true;
  }
}

  
