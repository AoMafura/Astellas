import 'package:flutter/material.dart';
import 'package:midterm_project/models/note.dart';
import 'services/database.dart';
import 'package:provider/provider.dart';
import 'package:midterm_project/notes_list2.dart';

class StudyNotesScreen extends StatefulWidget {
  @override
  _StudyNotesScreenState createState() => _StudyNotesScreenState();
}

class _StudyNotesScreenState extends State<StudyNotesScreen> {
  @override
  Widget build(BuildContext context){
    return StreamProvider<List<Note>>.value(
      value: DatabaseService().notes,
          child: SafeArea(
            child: Scaffold(
              appBar: yellowBar(),
              body: NotesList2(),
              backgroundColor: Colors.indigo[700],
              floatingActionButton: createNewButton(),
            )
    ));
  }

  

//---------Navbar----------------

  AppBar yellowBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.amber[600],
      title: const Text('Study Notes',  
        style: TextStyle(
          color: Colors.black
        ), 
      ),
      actions: <Widget> [
        settingButton()
      ]
    );
  }

  Builder settingButton(){
    return Builder(builder: (dashboardScreenContext) => IconButton(
      icon: const Icon(Icons.settings),
      iconSize: 34,
      tooltip: 'Settings',
      onPressed: () {
        Navigator.pushNamed(dashboardScreenContext, '/settings');
      },
    ));
  }

//---------Body----------------

  Column studyNotesScreenBody() {
    return Column(
      children: [
        note("Question","Answer"),
        note("Question","Answer"),
        note("Question","Answer"),
      ],
    );
  }

  Card note(var question, var answer) {
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