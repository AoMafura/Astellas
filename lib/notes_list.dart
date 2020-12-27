import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:midterm_project/models/note.dart';
import 'package:midterm_project/note_tile.dart';

class NotesList extends StatefulWidget {
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
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
        return NoteTile(note: notes[index]);
      },
    );
  }
}
