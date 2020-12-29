import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeactivateScreen extends StatefulWidget {
  @override
  _DeactivateScreenState createState() => _DeactivateScreenState();
}

class _DeactivateScreenState extends State<DeactivateScreen> {
  
  DateTime now = DateTime.now();
  String formattedDate = '';
  @override
  Widget build(BuildContext context){
    formattedDate = DateFormat('EEE yyyy-MM-dd kk:mm').format(now);
    return SafeArea(
      child: Scaffold(
        appBar: yellowBar(),
        body: Container(
          color: Colors.indigo[700],
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SingleChildScrollView(child: deactivateScreenBody()),
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
      title: const Text('Deactivate Account',  
        style: TextStyle(
          color: Colors.black
        ), 
      ),
    );
  }
  
//---------Body----------------

  Column deactivateScreenBody() {
    return Column(
      children: [
        title(" Deactivate Account"),
        note("Congratulations on your Graduation!", formattedDate),
        whiteDivider(),
        message("May we meet again~"),
        whiteDivider(),
        Column(
          children: [
            confirmButton('Deactivate Account',null),
            cancelButton('Cancel'),
          ],
        ),
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
            Icons.person_remove,
            size: 50,
            color: Colors.white
          ),
        ),
        Text(string,
          style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              height: 1.25,
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
              fontSize: 15,
              height: 1,
              fontStyle: FontStyle.italic)),
    );
  }


  Container confirmButton(var menuName, var menuRoute){
  return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
      height: 50.0,
      width: 500.0, 
      
      child: Builder(builder: (deleteScreenContext) => ElevatedButton(

        child: Text(
          menuName, style: TextStyle(color: Colors.white, fontSize: 18)
        ),

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red[900])
        ),
        onPressed:() {
          Navigator.of(context).pushNamedAndRemoveUntil(
            menuRoute, 
            (Route<dynamic> route) => false
          );
        }
      ))
    );
  }

  Container cancelButton(var menuName){
  return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
      height: 50.0,
      width: 500.0, 
      
      child: Builder(builder: (deleteScreenContext) => ElevatedButton(

        child: Text(
          menuName, style: TextStyle(color: Colors.black, fontSize: 18)
        ),

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[200])
        ),
        onPressed:() {
          Navigator.pop(deleteScreenContext);
        }
      ))
    );
  }
}