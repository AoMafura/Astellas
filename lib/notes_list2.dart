import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:midterm_project/models/note.dart';
import 'package:midterm_project/note_tile2.dart';

class NotesList2 extends StatefulWidget {
  @override
  _NotesList2State createState() => _NotesList2State();
}

class _NotesList2State extends State<NotesList2> {
  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<List<Note>>(context);

    notes.forEach((note) {
      print(note.question);
      print(note.answer);
    });
 
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NoteTile2(note: notes[index]);
      },
    );
  }
}
