import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_training/screens/admin/home_admin.dart';
import 'package:flight_training/screens/login.dart';
import 'package:flight_training/screens/student/home_student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class Adapter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    if (user == null) {
      return Login();
    } else {
      return isStudent ? HomeStudent() : HomeAdmin();
    }
  }
}
