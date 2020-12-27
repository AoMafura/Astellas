import 'package:flutter/material.dart';
import 'package:midterm_project/authenticate.dart';
import 'package:midterm_project/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:midterm_project/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return DashboardScreen();
    }
  }
}
