import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultChart extends StatefulWidget {
  final List<double> head_excepted;
  final List<double> head_real;
  final List<double> alt_ecepted;
  final List<double> alt_real;

  ResultChart(
      {Key key,
      this.title,
      this.head_excepted,
      this.head_real,
      this.alt_ecepted,
      this.alt_real})
      : super(key: key);

  final String title;

  @override
  _ResultChartState createState() => _ResultChartState(
        this.head_excepted,
        this.head_real,
        this.alt_ecepted,
        this.alt_real,
      );
}

class _ResultChartState extends State<ResultChart> {
  final List<double> head_excepted;
  final List<double> head_real;
  final List<double> alt_ecepted;
  final List<double> alt_real;
  final List<double> hardCode_head_excepted = [
    45.0,
    90.0,
    45.0,
    135.0,
    180.0,
    275.0,
    0.0,
    90.0,
    145.0,
    200.0
  ];
  final List<double> hardCode_head_real = [
    40.0,
    80.0,
    45.0,
    135.0,
    175.0,
    270.0,
    10.0,
    85.0,
    140.0,
    190.0
  ];
  final List<double> hardCode_alt_excepted = [
    10.0,
    50.0,
    50.0,
    100.0,
    400.0,
    400.0,
    500.0,
    300.0,
    150.0,
    75.0
  ];
  final List<double> hardCode_alt_real = [
    16.0,
    45.0,
    60.0,
    90.0,
    380.0,
    430.0,
    490.0,
    280.0,
    140.0,
    70.0
  ];

  String dropdownValueHead = 'Good';
  String dropdownValueAlt = 'Good';
  String dropdownValueOE = 'Pass';

  _ResultChartState(
      this.head_excepted, this.head_real, this.alt_ecepted, this.alt_real);

  Material mychart1Items(String title) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(title,
                      style: GoogleFonts.juliusSansOne(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue)),
                  SizedBox(
                    height: 50,
                  ),
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: new Sparkline(
                          data: hardCode_head_excepted,
                          lineColor: Color(0xffff6101),
                          pointsMode: PointsMode.all,
                          pointSize: 8.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: new Sparkline(
                          data: hardCode_head_real,
                          lineColor: Colors.green,
                          pointsMode: PointsMode.all,
                          pointSize: 8.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material mychart2Items(String title) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(title,
                      style: GoogleFonts.juliusSansOne(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue)),
                  SizedBox(
                    height: 50,
                  ),
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: new Sparkline(
                          data: hardCode_alt_excepted,
                          lineColor: Color(0xffff6101),
                          pointsMode: PointsMode.all,
                          pointSize: 8.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: new Sparkline(
                          data: hardCode_alt_real,
                          lineColor: Colors.green,
                          pointsMode: PointsMode.all,
                          pointSize: 8.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material eval() {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Head Maintenance"),
                    DropdownButton<String>(
                      value: dropdownValueHead,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blueAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValueHead = newValue;
                        });
                      },
                      items: <String>['Good', 'Best', 'Okay', 'Poor']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Altitude Maintenance"),
                    DropdownButton<String>(
                      value: dropdownValueAlt,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blueAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValueAlt = newValue;
                        });
                      },
                      items: <String>['Good', 'Best', 'Okay', 'Poor']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Overall evaluation "),
                    DropdownButton<String>(
                      value: dropdownValueOE,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blueAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValueOE = newValue;
                        });
                      },
                      items: <String>['Pass', 'Fail']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.blue,
                      child: Text("Review and Close"),
                      onPressed: () {
                        
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffE5E5E5),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: mychart1Items("Head Measure"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: mychart2Items("Altitude Measure"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: eval(),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(4, 250.0),
            StaggeredTile.extent(4, 250.0),
            StaggeredTile.extent(4, 250.0),
          ],
        ),
      ),
    );
  }
}
