git//Code By: Barriga, Hosea M.
//Midterm Project

import 'package:flutter/material.dart';
import 'package:midterm_project/dashboard.dart';
import 'package:midterm_project/register.dart';
import 'package:midterm_project/studyNotes.dart';
import 'package:midterm_project/createNote.dart';
import 'package:midterm_project/editNote.dart';
import 'package:midterm_project/deleteNote.dart';
import 'package:provider/provider.dart';
import 'package:midterm_project/models/user.dart';
import 'package:midterm_project/services/auth.dart';
import 'package:midterm_project/wrapper.dart';
import 'package:midterm_project/sign_in.dart';
import 'package:midterm_project/settings.dart';
import 'package:midterm_project/setUsername.dart';
import 'package:midterm_project/setEmail.dart';
import 'package:midterm_project/setPassword.dart';
import 'package:midterm_project/setDeactivate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes2 = {
      '/login': (loginScreenContext) => LoginScreen(),
      '/register': (registerScreenContext) => RegisterScreen(),
      '/dashboard': (dashboardScreenContext) => DashboardScreen(),
      '/studyNotes': (studyScreenContext) => StudyNotesScreen(),
      '/createNote': (createScreenContext) => CreateNoteScreen(),
      '/editNote': (editScreenContext) => EditNoteScreen(),
      '/deleteNote': (deleteScreenContext) => DeleteNoteScreen(),
      '/settings': (settingsScreenContext) => SettingsScreen(),
      '/setUsername': (usernameScreenContext) => UsernameScreen(),
      '/setEmail': (emailScreenContext) => EmailScreen(),
      '/setPassword': (passwordScreenContext) => PasswordScreen(),
      '/setDeactivate': (deactivateScreenContext) => DeactivateScreen(),
    };
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(home: Wrapper(), routes: routes2),
    );
  }
}
