import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportPage extends StatefulWidget {
  final DocumentSnapshot snapshot;

  const ReportPage({Key key, this.snapshot}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState(this.snapshot);
}

class _ReportPageState extends State<ReportPage> {
  final DocumentSnapshot snapshot;
  List<double> _headR;
  List<double> _altR;
  List<double> headE;
  List<double> altE;

  _ReportPageState(this.snapshot) {
    _headR = snapshot.data['headR'].cast<double>();
    _altR = snapshot.data['altR'].cast<double>();
    headE = snapshot.data['headE'].cast<double>();
    altE = snapshot.data['altE'].cast<double>();
    //print(_headR);
  }

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
                          data: headE, // snapshot.data['headE'].cast<double>(),
                          lineColor: Color(0xffff6101),
                          pointsMode: PointsMode.all,
                          pointSize: 8.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: new Sparkline(
                          data:_headR, //snapshot.data['headR'].map((s)=> s as double).toList(),
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
                          data:altE, //snapshot.data['altE'].map((s)=> s as double).toList(),
                          lineColor: Color(0xffff6101),
                          pointsMode: PointsMode.all,
                          pointSize: 8.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: new Sparkline(
                          data:
                              _altR, //snapshot.data['altR'].map((s)=> s as double).toList(),
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
                    Text(snapshot.data['hM'])
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Altitude Maintenance"),
                    Text(snapshot.data['aM'])
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Overall evaluation "),
                    Text(snapshot.data['oR']),
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
                      child: Text("Okay"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/student');
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
