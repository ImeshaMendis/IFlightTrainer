import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_training/services/firebase_service.dart';
import 'package:flight_training/utils/states.dart';
import 'package:flight_training/widgets/alert_dilalog.dart';
import 'package:flight_training/widgets/modal_button.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';

void main() => runApp(HomeStudent());

class HomeStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circular Bottom Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'circular_bottom_navigation'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPos = 0;
  bool _loading = false;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Home", Colors.blueAccent,
        labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.assignment, "EXAMS", Colors.blueAccent,
        labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.flight, "Tranings", Colors.blueAccent,
        labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.person, "Profile", Colors.blueAccent,
        labelStyle: TextStyle(fontWeight: FontWeight.normal)),
  ]);

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContainer(BuildContext context) {
      switch (selectedPos) {
        case 0:
          return Text("data");
          break;
        case 1:
          return Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 11 / 12,
                color: Colors.lightBlue,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    Text(
                      "Question Bank",
                      style: GoogleFonts.juliusSansOne(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                        child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => ModalButton(),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlueAccent,
                                    blurRadius:
                                        20.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        5.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      10.0, // horizontal, move right 10
                                      10.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.ac_unit,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Text("Metrology",
                                    style: GoogleFonts.juliusSansOne(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .display1,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlueAccent,
                                    blurRadius:
                                        20.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        5.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      10.0, // horizontal, move right 10
                                      10.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.healing,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Text("Human Performance And Limitations",
                                    style: GoogleFonts.juliusSansOne(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .display1,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlueAccent,
                                    blurRadius:
                                        20.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        5.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      10.0, // horizontal, move right 10
                                      10.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.map,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Text("Navigation",
                                    style: GoogleFonts.juliusSansOne(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .display1,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlueAccent,
                                    blurRadius:
                                        20.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        5.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      10.0, // horizontal, move right 10
                                      10.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.headset,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Text("Communication",
                                    style: GoogleFonts.juliusSansOne(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .display1,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlueAccent,
                                    blurRadius:
                                        20.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        5.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      10.0, // horizontal, move right 10
                                      10.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.swap_calls,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Text(" Flight Planning",
                                    style: GoogleFonts.juliusSansOne(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .display1,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlueAccent,
                                    blurRadius:
                                        20.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        5.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      10.0, // horizontal, move right 10
                                      10.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.flight_takeoff,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Text("Principles of Flight",
                                    style: GoogleFonts.juliusSansOne(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .display1,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlueAccent,
                                    blurRadius:
                                        20.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        5.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      10.0, // horizontal, move right 10
                                      10.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.flight,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Text("Aircraft General Knowledge",
                                    style: GoogleFonts.juliusSansOne(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .display1,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlueAccent,
                                    blurRadius:
                                        20.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        5.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      10.0, // horizontal, move right 10
                                      10.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.book,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Text("Airlaw",
                                    style: GoogleFonts.juliusSansOne(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .display1,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              )
            ],
          );

          break;
        case 2:
          return Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 11 / 12,
                color: Colors.lightBlue,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Text(
                          "Tranings",
                          style: GoogleFonts.juliusSansOne(
                              textStyle: Theme.of(context).textTheme.display1,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: LoadingOverlay(
                          child: InkWell(
                            onTap: () async {
                              _loading = true;
                              getAvailbeDates().then((dateList) async {
                                _loading = false;
                                try {
                                  DateTime newDateTime =
                                      await showRoundedDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    lastDate: DateTime(DateTime.now().year + 1),
                                    firstDate:
                                        DateTime(DateTime.now().year - 1),
                                    borderRadius: 16,
                                    textPositiveButton: "BOOK",
                                    builderDay: (DateTime dateTime,
                                        bool isCurrentDay,
                                        bool isSelected,
                                        TextStyle defaultTextStyle) {
                                      for (var date in dateList) {
                                        if (dateTime.day == int.parse(date)) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.pink[300],
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: Center(
                                              child: Text(
                                                dateTime.day.toString(),
                                                style: defaultTextStyle,
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                  );
                                  if (newDateTime.day != null) {
                                    if (dateList
                                        .contains(newDateTime.day.toString())) {
                                      Firestore.instance
                                          .collection('lesson')
                                          .document()
                                          .setData(
                                        {
                                          'date': newDateTime.day.toString(),
                                          'state': "PENDING",
                                          'date':"Set Time"
                                        },
                                      );
                                      Fluttertoast.showToast(
                                          msg: "Booked Successfully",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please Select Availble Date",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  }
                                } catch (e) {
                                  print(e.toString());
                                }
                              });
                            },
                            child: Chip(
                              backgroundColor: Colors.white,
                              label: Text("Reserve",
                                  style: GoogleFonts.juliusSansOne(
                                      textStyle:
                                          Theme.of(context).textTheme.display1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blue)),
                            ),
                          ),
                          isLoading: _loading,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream:
                          Firestore.instance.collection('lesson').snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Text('Loading...');
                          default:
                            return ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              children: snapshot.data.documents
                                  .map((DocumentSnapshot document) {
                                return lessonCardBuilder(
                                    context: context,
                                    documentSnapshot: document);
                              }).toList(),
                            );
                        }
                      },
                    ),
                  ),
                ]),
              ),
            ],
          );

          break;
        case 3:
          return Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 11 / 12,
                color: Colors.lightBlue,
                
              )
            ],
          );

          break;
      }
    }

    Widget bottomNav(BuildContext context) {
      return CircularBottomNavigation(
        tabItems,
        controller: _navigationController,
        barHeight: MediaQuery.of(context).size.height / 12,
        barBackgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        selectedCallback: (int selectedPos) {
          setState(() {
            this.selectedPos = selectedPos;
            print(_navigationController.value);
          });
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(context),
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 12),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottomNav(context),
          )
        ],
      ),
    );

    @override
    void dispose() {
      super.dispose();
      _navigationController.dispose();
    }
  }

  Padding lessonCardBuilder(
      {BuildContext context, DocumentSnapshot documentSnapshot}) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Take Off",
                    style: GoogleFonts.juliusSansOne(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: documentSnapshot['state'] == "APPROVED"
                        ? Text(
                            "2019/04/" +
                                documentSnapshot['date'] +
                                " " +
                                documentSnapshot['time'].toString(),
                            style: GoogleFonts.juliusSansOne(
                                textStyle: Theme.of(context).textTheme.display1,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.blueGrey),
                          )
                        : Text("")),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Chip(
                    label: Text(documentSnapshot['state'].toString()),
                  ),
                )
              ],
            ),
            if (documentSnapshot['state'] == "PENDING")
              Positioned(
                right: 10,
                top: -10,
                child: IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    await Firestore.instance
                        .collection('lesson')
                        .document(documentSnapshot.documentID)
                        .delete();
                  },
                ),
              ),
            if (documentSnapshot['state'] == "DECLINED")
              Positioned(
                right: 10,
                top: -10,
                child: IconButton(
                  icon: Icon(
                    Icons.note,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    await notice(context, documentSnapshot);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
