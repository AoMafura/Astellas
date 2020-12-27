import 'package:flutter/material.dart';
import 'package:midterm_project/services/auth.dart';
import 'package:midterm_project/shared/loading.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView;
  LoginScreen({this.toggleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //textfield state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext loginScreenContext) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              body: Container(
                color: Colors.indigo[700],
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: SingleChildScrollView(child: loginScreenBody()),
                ),
              ),
            ),
          );
  }

  Column loginScreenBody() {
    return Column(
      children: [
        avatar(),
        title('Study Notes'),
        subTitle('Log in'),
        whiteDivider(),
        Form(
            key: _formKey,
            child: Column(children: [
              emailFormField(),
              passwordFormField(),
              registerOption(),
              loginButton(),
              SizedBox(
                height: 12.0,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ])),
      ],
    );
  }

  Container avatar() {
    return Container(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Image.asset('assets/images/avatar.jpg',
          width: 130.0, height: 130.0, fit: BoxFit.cover),
    ));
  }

  Container title(var string) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 20, 0.0, 5),
      child: Text(string,
          style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              height: 1,
              fontStyle: FontStyle.italic)),
    );
  }

  Container subTitle(var string) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Text(string,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              height: 1,
              fontStyle: FontStyle.italic)),
    );
  }

  Container whiteDivider() {
    return Container(
        padding: EdgeInsets.fromLTRB(70, 0, 70, 10),
        child: Divider(color: Colors.white));
  }

  Container emailFormField() {
    return Container(
        child: TextFormField(
      validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
      onChanged: (val) {
        setState(() => email = val);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 3, color: Colors.purpleAccent[200]),
          ),
          fillColor: Colors.white,
          focusColor: Colors.purpleAccent[200],
          filled: true,
          prefixIcon: Container(
            child: Icon(Icons.email, color: Colors.black),
          ),
          labelText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    ));
  }

  Container passwordFormField() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          validator: (val) => val.isEmpty ? "Enter a valid password" : null,
          obscureText: true,
          onChanged: (val) {
            setState(() => password = val);
          },
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide:
                    BorderSide(width: 3, color: Colors.purpleAccent[200]),
              ),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Container(
                child: Icon(Icons.lock, color: Colors.black),
              ),
              labelText: "Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ));
  }

  Container registerOption() {
    return Container(
        margin: EdgeInsets.only(top: 7.0),
        child: Row(children: <Widget>[
          Expanded(
            child: Text('Do not have an account?',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.right),
          ),
          registerButton()
        ]));
  }

  Builder registerButton() {
    return Builder(
      builder: (context) => TextButton(
        child: Text(' Register.', style: TextStyle(color: Colors.amber[600])),
        onPressed: () {
          widget.toggleView();
          Navigator.pushNamed(context, '/register');
        },
      ),
    );
  }

  Container loginButton() {
    return Container(
        margin: EdgeInsets.fromLTRB(25, 0, 25, 10),
        height: 50.0,
        width: 500.0,
        child: Builder(
            builder: (loginScreenContext) => ElevatedButton(
                child: Text('Login',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                    style: ButtonStyle(
                      backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber[600])),
                        
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    dynamic result =
                        await _auth.logInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Could not sign with those credentials.';
                        loading = false;
                      });
                    }
                  }
                  Navigator.pushReplacementNamed(
                      loginScreenContext, '/dashboard');
                })));
  }
}