import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeOwner extends StatefulWidget {
  @override
  _HomeOwnerState createState() => _HomeOwnerState();
}

class _HomeOwnerState extends State<HomeOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(text: "Students", icon: Icon(Icons.person)),
                      Tab(text: "Flights", icon: Icon(Icons.flight)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        StudentList(),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        FlightList(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            flex: 2,
          )
        ],
      ),
    );
  }
}

class StudentList extends StatelessWidget {
  const StudentList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('user').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Select lot');
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return snapshot.data.documents.length == 0
                    ? Text("no uers")
                    : ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return studentVIew(document);
                        }).toList(),
                      );
              case ConnectionState.done:
                return Text('\$${snapshot.data} (closed)');
            }
            return null; // unreachable
          },
        ),
      ),
    );
  }
}

Widget studentVIew(DocumentSnapshot snapshot) {
  return Column(
    children: <Widget>[
      Material(
        color: Colors.white,
        elevation: 7.0,
        borderRadius: BorderRadius.circular(11.0),
        shadowColor: Color(0x802196F3),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(snapshot.data['name'],
                      style: GoogleFonts.juliusSansOne(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue)),
                  Text(
                    "(" + snapshot.data['regId'] + ")",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "(" + snapshot.data['trainingSchool'] + ")",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Availble flight hours",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              int current = int.parse(snapshot.data['hours']);
                              int newValue = current - 1;
                              Firestore.instance
                                  .collection('user')
                                  .document(snapshot.documentID)
                                  .updateData({"hours": newValue.toString()});
                            },
                            child: Chip(
                              elevation: 12,
                              backgroundColor: Colors.lightBlue,
                              label: Icon(Icons.keyboard_arrow_left,
                                  size: 15, color: Colors.white),
                            ),
                          ),
                          Chip(
                            backgroundColor: Colors.blueAccent,
                            label: Text(snapshot.data['hours'],
                                style: GoogleFonts.juliusSansOne(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ),
                          GestureDetector(
                            onTap: () {
                              int current = int.parse(snapshot.data['hours']);
                              int newValue = current + 1;
                              Firestore.instance
                                  .collection('user')
                                  .document(snapshot.documentID)
                                  .updateData({"hours": newValue.toString()});
                            },
                            child: Chip(
                                elevation: 12,
                                backgroundColor: Colors.lightBlue,
                                label: Icon(Icons.keyboard_arrow_right,
                                    size: 15, color: Colors.white)),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 12),
    ],
  );
}

class FlightList extends StatelessWidget {
  const FlightList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('user').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Select lot');
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return snapshot.data.documents.length == 0
                    ? Text("no uers")
                    : ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return flightView(document);
                        }).toList(),
                      );
              case ConnectionState.done:
                return Text('\$${snapshot.data} (closed)');
            }
            return null; // unreachable
          },
        ),
      ),
    );
  }
}

Widget flightView(DocumentSnapshot snapshot) {
  return Column(
    children: <Widget>[
      Material(
        color: Colors.white,
        elevation: 7.0,
        borderRadius: BorderRadius.circular(11.0),
        shadowColor: Color(0x802196F3),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(snapshot.data['name'],
                      style: GoogleFonts.juliusSansOne(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue)),
                  Text(
                    "(" + snapshot.data['regId'] + ")",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "(" + snapshot.data['trainingSchool'] + ")",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Availble flight hours",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              int current = int.parse(snapshot.data['hours']);
                              int newValue = current - 1;
                              Firestore.instance
                                  .collection('user')
                                  .document(snapshot.documentID)
                                  .updateData({"hours": newValue.toString()});
                            },
                            child: Chip(
                              elevation: 12,
                              backgroundColor: Colors.lightBlue,
                              label: Icon(Icons.keyboard_arrow_left,
                                  size: 15, color: Colors.white),
                            ),
                          ),
                          Chip(
                            backgroundColor: Colors.blueAccent,
                            label: Text(snapshot.data['hours'],
                                style: GoogleFonts.juliusSansOne(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ),
                          GestureDetector(
                            onTap: () {
                              int current = int.parse(snapshot.data['hours']);
                              int newValue = current + 1;
                              Firestore.instance
                                  .collection('user')
                                  .document(snapshot.documentID)
                                  .updateData({"hours": newValue.toString()});
                            },
                            child: Chip(
                                elevation: 12,
                                backgroundColor: Colors.lightBlue,
                                label: Icon(Icons.keyboard_arrow_right,
                                    size: 15, color: Colors.white)),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 12),
    ],
  );
}
