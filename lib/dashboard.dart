import 'package:flutter/material.dart';
import 'package:midterm_project/models/note.dart';
import 'services/database.dart';
import 'package:provider/provider.dart';
import 'package:midterm_project/notes_list.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Note>>.value(
      value: DatabaseService().notes,
      child: WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
            child: Scaffold(
              appBar: yellowBar(),
              body: NotesList(),
              backgroundColor: Colors.indigo[700],
          ))),
    );
  }

//---------Navbar----------------

  AppBar yellowBar() {
    return AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.amber[600],
        title: const Text(
          'Answer Notes',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[folderButton(), settingButton()]);
  }

   
Builder folderButton(){
  return Builder(builder: (dashboardScreenContext) => IconButton(
    icon: const Icon(Icons.folder_rounded),
    iconSize: 34,
    tooltip: 'Study Notes',
    onPressed: () {
      Navigator.pushNamed(dashboardScreenContext, '/studyNotes');
    },
  ));
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

  Column dashboardScreenBody() {
    return Column(
      children: [
        note("Question Lorem ipsum abc abc abcv abvc","Answer"),
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
                Alignment(0.2, 0.0), // 10% of the width, so there are ten blinds.
            colors: [
              const Color(0xffb2ebf2),
              const Color(0xff82b1ff),
            ], // red to yellow
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
}
