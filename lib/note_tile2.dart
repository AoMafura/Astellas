import 'package:flutter/material.dart';
import 'package:midterm_project/models/note.dart';

class NoteTile2 extends StatelessWidget {
  final Note note;

  NoteTile2({this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[700],
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Center(
        child: SingleChildScrollView(child: studyNotesScreenBody()),
      ),
    );
  }

  Column studyNotesScreenBody() {
    return Column(
      children: [
        noteCard(note.question,note.answer),
      ],
    );
  }

  Card noteCard(var question, var answer) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 25),
      elevation: 12,
      child: Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end:
                Alignment(0.2, 0.0),
            colors: [
              const Color(0xffb2ebf2),
              const Color(0xff82b1ff),
            ], 
            tileMode: TileMode.clamp
          ),
        ),
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
              noteTitle(),
              noteQuestion(question),
              noteAnswer(answer),
            ],)
          ),
          noteMenu()
        ],)
      )
    );
  }

  Container noteTitle(){
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      height: 30,
      child: Container(
        margin: EdgeInsets.only(left: 5),
        width: 175,
        height: 30,
      ),
    );
  }

  Align noteMenu(){
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 0, 20, 0),
        width: 80,
        height: 50,
          child: Row(children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 30,
              height: 30,
              child: editButton()
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 30,
              height: 30,
              child: deleteButton()
            ),
          ],),
      )
    );
  }

  Container noteQuestion(var question){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(20,6,20,0),
      width: 270,
      height: 100,
      child: Text(question,
        style: TextStyle(
            color: Colors.brown[900],
            fontSize: 20,
            height: 1,
            fontStyle: FontStyle.italic),
            textAlign: TextAlign.center
        ),
    );
  }

  Container noteAnswer(var answer){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 5),
      width: 270,
      height: 30,
      child: Text(answer,
          style: TextStyle(
              color: Colors.brown[900],
              fontSize: 18,
              height: 1,
              fontStyle: FontStyle.italic)),
    );
  }

//-----------------Note Buttons (Edit, Delete)----------------

  Builder editButton(){
    return Builder(builder: (editScreenContext) => IconButton(
      icon: const Icon(Icons.edit),
      iconSize: 25,
      tooltip: 'Edit Note',
      color: Colors.black,
      onPressed: () {
        Navigator.pushNamed(editScreenContext, '/editNote');
      },
    ));
  }

  Builder deleteButton(){
    return Builder(builder: (deleteScreenContext) => IconButton(
      icon: const Icon(Icons.delete),
      iconSize: 25,
      tooltip: 'Delete Note',
      color: Colors.black,
      onPressed: () {
       Navigator.pushNamed(deleteScreenContext, '/deleteNote');
      },
    ));
  }

//------------Add Button (Floating Action Button)-----------------

  FloatingActionButton createNewButton(){
    return FloatingActionButton(
      backgroundColor: Colors.amber[600],
      child: Builder(builder: (createScreenContext) => IconButton(
        icon: const Icon(Icons.add),
        iconSize: 40,
        color: Colors.black,
        tooltip: 'Create New Note',
        onPressed: () {
        Navigator.pushNamed(createScreenContext, '/createNote');
        },
      )),

      onPressed: () {
        
      },

    );
  }
}
