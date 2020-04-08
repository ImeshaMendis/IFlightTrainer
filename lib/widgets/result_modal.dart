import 'package:flight_training/screens/student/home_student.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class ResultModal extends StatefulWidget {
  final int result;

  ResultModal({this.result});

  @override
  State<StatefulWidget> createState() => ResultModalState(result);
}

class ResultModalState extends State<ResultModal>
    with SingleTickerProviderStateMixin {
  final int result;
  AnimationController controller;
  Animation<double> scaleAnimation;

  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.white,
    Colors.grey,
  ];

  ResultModalState(this.result);

  @override
  void initState() {
    super.initState();
    dataMap.putIfAbsent("Correct", () => result.toDouble());
    dataMap.putIfAbsent("Incorrect", () => 10.0 - result.toDouble());

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: MediaQuery.of(context).size.height / 1.9,
            decoration: ShapeDecoration(
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: ListView(
                children: <Widget>[
                  Text("Results",
                      style: GoogleFonts.juliusSansOne(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  PieChart(
                      dataMap: dataMap,
                      showChartValueLabel: false,
                      animationDuration: Duration(milliseconds: 800),
                      showChartValuesOutside: false,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      showLegends: false,
                      colorList: colorList),
                  RaisedButton(
                    color: Colors.black45,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeStudent()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Text("Done",
                        style: GoogleFonts.juliusSansOne(
                            textStyle: Theme.of(context).textTheme.display1,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
