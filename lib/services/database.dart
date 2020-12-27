import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:midterm_project/models/note.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  //collection reference
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
}
