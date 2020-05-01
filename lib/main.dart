import 'package:flight_training/screens/admin/admin_lseeson_view.dart';
import 'package:flight_training/screens/admin/home_admin.dart';
import 'package:flight_training/screens/charts/result_chart.dart';
import 'package:flight_training/screens/exam.dart';
import 'package:flight_training/screens/login.dart';
import 'package:flight_training/screens/owner/home_owner.dart';
import 'package:flight_training/screens/student/home_student.dart';
import 'package:flutter/material.dart';

int flightHours = 0;
void main() => runApp(FlightApp());

class FlightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      initialRoute: "/",
      routes: {
        '/admin': (context) => HomeAdmin(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/student': (context) => HomeStudent(),
        '/admin_lesson_view': (context) => AdminLessonView(),
        '/start_exam': (context) => Exam(),
        '/result_chart': (context) => ResultChart(),
        '/log_out': (context) => Login(),
        '/owner': (contextt) => HomeOwner(),
      },
    );
  }
}
