import 'package:flutter/material.dart';
import 'package:midterm_project/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:midterm_project/models/user.dart';
import 'package:midterm_project/sign_in.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return LoginScreen();
    } else {
      return DashboardScreen();
    }
  }
}
