import 'package:flutter/material.dart';
import 'package:midterm_project/services/auth.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: yellowBar(),
      body: Container(
        color: Colors.indigo[700],
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(child: settingsScreenBody()),
        ),
      ),
    ));
  }

//---------Navbar----------------

  AppBar yellowBar() {
    return AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.amber[600],
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ));
  }

//---------Body----------------

  Column settingsScreenBody() {
    return Column(
      children: [
        note("Username", "Email", "Password"),
        whiteDivider(),
        Column(
          children: [
            menuButton('Change Username', 'usernameScreenContext','/setUsername'),
            menuButton('Change Email', 'emailScreenContext','/setEmail'),
            menuButton('Change Password', 'passwordScreenContext','/setPassword'),
            menuRedButton('Deactivate Account', 'deactivateScreenContext','/setDeactivate'),
          ],
        ),
        whiteDivider(),
        logOutButton('Log Out')
      ],
    );
  }

  Card note(var username, var email, var password) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 25),
      elevation: 12,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 3, 0,0),
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
        child: Column(children: [
          usernameField('Temp Username aaaa a a a'),
          emailField('Temp Email@.email.com'),
          passwordField('Temp Password'),
        ],)
      )
    );
  }

  Container whiteDivider() {
    return Container(
        padding: EdgeInsets.fromLTRB(70, 0, 70, 10),
        child: Divider(color: Colors.white));
  }

  Container menuButton(var menuName, var context, var menuRoute){
  return Container(
    margin: EdgeInsets.fromLTRB(25, 0, 25, 10),
    height: 50.0,
    width: 500.0, 
    
    child: Builder(builder: (context) => ElevatedButton(

      child: Text(
        menuName, style: TextStyle(color: Colors.black, fontSize: 18)
      ),

      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[200])
      ),
      onPressed:() {
        Navigator.pushNamed(context, menuRoute);
      }
    ))
  );
  }
  
  Container menuRedButton(var menuName, var context, var menuRoute){
  return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 10),
      height: 50.0,
      width: 500.0, 
      
      child: Builder(builder: (context) => ElevatedButton(

        child: Text(
          menuName, style: TextStyle(color: Colors.white, fontSize: 18)
        ),

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red[900])
        ),
        onPressed:() {
          // Navigator.pushNamed(context, menuRoute);
        }
      ))
    );
  }

  Container logOutButton(var string) {
    return Container(
        margin: EdgeInsets.fromLTRB(25, 0, 25, 10),
        height: 50.0,
        width: 500.0,
        child: Builder(
            builder: (context) => ElevatedButton(
                child: Text(string,
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber[600])),
                onPressed: () async {
                  await _auth.signOut();

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                })));
  }

//-------------------------user info fields----------------

  Container titleField(var title){
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: 260,
      child: Text(title,
      style: TextStyle(
          color: Colors.brown[900],
          fontSize: 18,
          height: 1,
          fontWeight: FontWeight.bold)),
    );
  }

  Container textField(var text){
    return Container(
      margin: EdgeInsets.fromLTRB(35,10,20,0),
      width: 270,
      child: Text(text,
      style: TextStyle(
          color: Colors.brown[900],
          fontSize: 17,
          height: 1,
          fontStyle: FontStyle.italic)),
    );
  }

  Container usernameField(var username){
    return Container(
      child: Column(children: [
        titleField("Username"),
        textField(username)
      ],)
    );
  }
  
  Container emailField(var email){
    return Container(
      child: Column(children: [
        titleField("Email"),
        textField(email)
      ],)
    );
  }
  
  Container passwordField(var password){
    return Container(
      child: Column(children: [
        titleField("Password"),
        textField(password)
      ],)
    );
  }
}
