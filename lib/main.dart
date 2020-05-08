import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_training/adapter.dart';
import 'package:flight_training/screens/admin/admin_lseeson_view.dart';
import 'package:flight_training/screens/admin/home_admin.dart';
import 'package:flight_training/screens/charts/result_chart.dart';
import 'package:flight_training/screens/exam.dart';
import 'package:flight_training/screens/login.dart';
import 'package:flight_training/screens/owner/home_owner.dart';
import 'package:flight_training/screens/student/home_student.dart';
import 'package:flight_training/widgets/google_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

int flightHours = 0;
bool isStudent=true;
void main() => runApp(FlightApp());

class FlightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamProvider<FirebaseUser>.value(
        child: Adapter(),
        value: GoogleLogin().user,
      ),
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
