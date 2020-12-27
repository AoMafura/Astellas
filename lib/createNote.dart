import 'package:flutter/material.dart';
import 'package:midterm_project/services/database.dart';

class CreateNoteScreen extends StatefulWidget {
  @override
  _CreateNoteScreenState createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //textfield state
  String question = '', answer = '', error = '';
  int timestamp;

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: yellowBar(),
        body: Container(
          color: Colors.indigo[700],
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SingleChildScrollView(child: createNoteScreenBody()),
          ),
        ),
      )
    );
  }

//---------Navbar----------------

  AppBar yellowBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.amber[600],
      title: const Text('Create New Note',  
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

  Column createNoteScreenBody() {
    return Column(
      children: [
        title(" Create New Note"),
        Form(
            key: _formKey,
            child: Column(children: [
              note(question,answer),
              whiteDivider(),
              message("Are you sure you wish to create this note?"),
              whiteDivider(),
              Column(
                children: [
                  confirmButton('Confirm'),
                  cancelButton('Cancel'),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],),
        ],))
      ],
    );
  }
  
  Container whiteDivider() {
    return Container(
            padding: EdgeInsets.fromLTRB(70, 0, 70, 10),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Colors.white)
            );
  }

  Container title(var string) {
    return Container(
      margin: EdgeInsets.fromLTRB(35, 20, 40, 5),
      child: Row(children: [
        Container(
          child: const Icon(
            Icons.add_circle_outline,
            size: 50,
            color: Colors.white
          ),
        ),
        Text(string,
          style: TextStyle(
              color: Colors.white,
              fontSize: 29,
              height: 1.1,
              fontStyle: FontStyle.italic
          )
        ),
      ],)
    );
  }

  Container message(var string) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Text(string,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              height: 1,
              fontStyle: FontStyle.italic)),
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
              noteQuestion(),
              noteAnswer(),
            ],)
          ),
        ],)
      )
    );
  }

  Container noteTitle(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      height: 30,
      child: Container(
        alignment: Alignment.centerLeft,
        width: 175,
        height: 30,
        child: Text("Question",
          style: TextStyle(
              color: Colors.brown[900],
              fontSize: 18,
              height: 1,
              fontStyle: FontStyle.italic)
        )
      ),
    );
  }

  Container noteQuestion(){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(20,6,20,0),
      width: 270,
      height: 100,
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Write a Question' : null,
        onChanged: (val) {
          setState(() => question = val);
        },
        keyboardType: TextInputType.multiline,
        maxLines: 3,
        initialValue: question,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 3, color: Colors.purpleAccent[200]),
            ),
            fillColor: Colors.white,
            focusColor: Colors.purpleAccent[200],
            filled: true,
            labelText: "Question",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      )
    );
  }

  Container noteAnswer(){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 5),
      width: 200,
      height: 30,
      child: TextFormField(
        validator: (val) => val.isEmpty ? "Write the Answer" : null,
        onChanged: (val) {
          setState(() => answer = val);
        },
        keyboardType: TextInputType.text,
        initialValue: answer,
        style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 3, color: Colors.purpleAccent[200]),
            ),
            prefixIcon: Container(
              child: Icon(Icons.check_circle_rounded, color: Colors.black),
            ),
            fillColor: Colors.white,
            focusColor: Colors.purpleAccent[200],
            filled: true,
            labelText: "Answer",
            contentPadding: EdgeInsets.fromLTRB(5,14,10,0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      )
    );
  }

  Container confirmButton(var menuName){
  return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
      height: 50.0,
      width: 500.0, 
      
      child: Builder(builder: (createScreenContext) => ElevatedButton(

        child: Text(
          menuName, style: TextStyle(color: Colors.black, fontSize: 18)
        ),

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.amber[600])
        ),
        onPressed: () async {
           if (_formKey.currentState.validate()) {
              setState(() => timestamp = DateTime.now().millisecondsSinceEpoch);

              _handleCreateSubmission(
                question, 
                answer,
                timestamp
              );
              Navigator.pop(createScreenContext);
          }}
      ))
    );
  }

  Container cancelButton(var menuName){
  return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
      height: 50.0,
      width: 500.0, 
      
      child: Builder(builder: (createScreenContext) => ElevatedButton(

        child: Text(
          menuName, style: TextStyle(color: Colors.black, fontSize: 18)
        ),

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[200])
        ),
        onPressed:() {
          Navigator.pop(createScreenContext);
        }
      ))
    );
  }

  void _handleCreateSubmission(String question, String answer, var timestamp){
    var note = <String, dynamic>{
      'question': question,
      'answer' : answer,
      'timestamp' : timestamp,
    };
    DatabaseService.addNote(note);
  }
}