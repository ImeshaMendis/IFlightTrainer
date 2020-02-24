import 'dart:async';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flight_training/models/user_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    // var userLocation = Provider.of<UserLocation>(context);
    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(
        child: ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.lightBlueAccent]),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 30,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height / 35,
                        backgroundColor: Colors.lightBlue,
                        child: Icon(Icons.person,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.height / 25),
                      ),
                    ),
                    top: MediaQuery.of(context).size.height / 20,
                    right: MediaQuery.of(context).size.width / 15,
                  ),
                  Positioned(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "R N D Ramanayaka",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.juliusSansOne(
                                textStyle: Theme.of(context).textTheme.display1,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Text(
                            "(Flight Trainer)",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.juliusSansOne(
                                textStyle: Theme.of(context).textTheme.display1,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      top: MediaQuery.of(context).size.height / 6,
                      left: MediaQuery.of(context).size.width / 15)
                ],
              ),
            )),
        flex: 1,
      ),
      Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 15.0),
              child: Divider(
                color: Colors.black,
                height: 20,
              )),
        ),
        Text(
          "Trainings",
          textAlign: TextAlign.center,
          style: GoogleFonts.juliusSansOne(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        Expanded(
          flex: 5,
          child: new Container(
              margin: const EdgeInsets.only(left: 15.0, right: 10.0),
              child: Divider(
                color: Colors.black,
                height: 20,
              )),
        ),
      ]),
      SizedBox(height: 20),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DatePickerTimeline(
              DateTime.now(),
              selectionColor: Colors.lightBlue,
              onDateChange: (date) {
                // New date selected
                print(date.day.toString());
              },
            ),
            Container(
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    LessonsBooking(),
                    LessonsBooking(),
                    LessonsBooking(),
                  ],
                ),
              ),
            )
          ],
        ),
        flex: 2,
      )
    ]));
  }
}

class LessonsBooking extends StatelessWidget {
  const LessonsBooking({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LessonView();
  }
}

class LessonView extends StatefulWidget {
  const LessonView({
    Key key,
  }) : super(key: key);

  @override
  _LessonViewState createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {
  String time = "Set Time";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Stack(children: <Widget>[
        Column(children: <Widget>[
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blueAccent, Colors.blue],
              ),
            ),
          ),
        ]),
        Positioned(
          child: Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red,
              ),
              child: ClipOval(
                child: Material(
                  color: Colors.red, // button color
                  child: InkWell(
                    splashColor: Colors.redAccent, // inkwell color
                    child: SizedBox(
                        width: 25,
                        height: 25,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                    onTap: () {
                      //TODO close button
                      print("close button pressed");
                    },
                  ),
                ),
              )),
          top: 0,
          right: 10,
        ),
        Positioned(
          child: Container(
            child: InkWell(
              splashColor: Colors.blueAccent,
              onTap: () {
                DatePicker.showTimePicker(context, showTitleActions: true,
                    onChanged: (date) {
                  // print(date.hour);
                }, onConfirm: (date) {
                  setState(() {
                    time = date.hour.toString() + ":" + date.minute.toString();
                  });
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: Chip(
                backgroundColor: Colors.white60,
                label: Text(
                  time == "Set Time" ? "Set Time" : time,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
          top: -10,
          right: 60,
        ),
        Positioned(
          child: Text(
            "Take Off",
            textAlign: TextAlign.center,
            style: GoogleFonts.juliusSansOne(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 40,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
          top: 20,
          left: 10,
        ),
        Positioned(
          child: Text(
            "Sunil Perera - Lv1",
            textAlign: TextAlign.center,
            style: GoogleFonts.dosis(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
          bottom: 30,
          left: 20,
        ),
        Positioned(
          child: Text(
            "961245982V",
            textAlign: TextAlign.center,
            style: GoogleFonts.dosis(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
          bottom: 15,
          left: 20,
        ),
        Positioned(
          child: Center(
            child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.golf_course,
                  color: Colors.black,
                ),
                label: Text(
                  "Start",
                  style: GoogleFonts.dosis(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                color: Colors.white),
          ),
          bottom: 15,
          right: 20,
        )
      ]),
    );
  }
}
