import 'package:flight_training/models/user_location.dart';
import 'package:flight_training/services/location_service.dart';
import 'package:flight_training/widgets/map_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminLessonView extends StatefulWidget {
  @override
  _AdminLessonViewState createState() => _AdminLessonViewState();
}

class _AdminLessonViewState extends State<AdminLessonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Take Off"),
      ),
      body: StreamProvider<UserLocation>(
        create: (context) => LocationService().locationStream,
        child: Column(
          children: <Widget>[
             Expanded(
              child:Placeholder(),
              flex: 1,
            ),
            Expanded(
              child:Map(),
              flex: 1,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child:Placeholder(),
                    flex: 1,
                  ),
                  Expanded(
                    child: Placeholder(),
                    flex: 1,
                  )
                ],
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
