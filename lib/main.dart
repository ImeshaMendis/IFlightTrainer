import 'package:flight_training/screens/admin/home_admin.dart';
import 'package:flight_training/screens/admin/home_student.dart';
import 'package:flight_training/screens/login.dart';
import 'package:flight_training/services/location_service.dart';
import 'package:flight_training/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user_location.dart';

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
  },
    );
  }
}

/*

StreamProvider<UserLocation>(
      create: (context) => LocationService().locationStream,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            body: Map(),
          )),
    );
*/