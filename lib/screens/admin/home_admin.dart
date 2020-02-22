import 'dart:async';

import 'package:flight_training/models/user_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
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
      Expanded(
        child: Placeholder(),
        flex: 2,
      )
    ]));
  }
}
