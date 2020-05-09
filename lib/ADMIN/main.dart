import 'package:flight_training/screens/owner/home_owner.dart';
import 'package:flutter/material.dart';
import 'package:flight_training/ADMIN/admin_login.dart';

int flightHours = 0;
bool isStudent=true;
bool isMockExam=false;
void main() => runApp(FlightApp());

class FlightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminLogin(),
      initialRoute: "/",
      routes: {
        '/owner': (contextt) => HomeOwner(),
      },
    );
  }
}
