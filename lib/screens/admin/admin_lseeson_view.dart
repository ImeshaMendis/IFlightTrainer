import 'package:flight_training/models/user_location.dart';
import 'package:flight_training/screens/charts/result_chart.dart';
import 'package:flight_training/services/alt_pass_service.dart';
import 'package:flight_training/services/head_pass_service.dart';
import 'package:flight_training/services/location_service.dart';
import 'package:flight_training/widgets/alt_selector.dart';
import 'package:flight_training/widgets/head_selector.dart';
import 'package:flight_training/widgets/map_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AdminLessonView extends StatefulWidget {
  final String id;

  AdminLessonView({Key key, this.id}) : super(key: key);
  @override
  _AdminLessonViewState createState() => _AdminLessonViewState(this.id);
}

class _AdminLessonViewState extends State<AdminLessonView> {
  final String id;
  HeadPassService hs = HeadPassService();
  AltPassService als = AltPassService();

  _AdminLessonViewState(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Take Off"),
      ),
      body: StreamProvider<UserLocation>(
        initialData:
            UserLocation(head: 0.0, altitude: 0.0, longitude: 0.0, speed: 0.0),
        create: (context) => LocationService().locationStream,
        child: SlidingUpPanel(
          panel: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      StreamProvider<double>.value(
                        initialData: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: HeadSelector(),
                        ),
                        value: hs.headPassStream,
                      ),
                    ],
                  ),
                  StreamProvider<int>.value(
                    initialData: 0,
                    child: AltSelector(),
                    value: als.altPassStream,
                  ),
                ],
              ),
              MultiProvider(
                providers: [
                  StreamProvider<double>.value(
                      initialData: 0.0, value: hs.headPassStream),
                  StreamProvider<int>.value(
                      initialData: 0, value: als.altPassStream),
                ],
                child: AddToChartButton(
                  id: this.id,
                ),
              ),
            ],
          ),
          body: Center(
            child: Map(),
          ),
        ),
      ),
    );
  }
}

class AddToChartButton extends StatelessWidget {
  final String id;
  List<double> head_excepted = [];
  List<double> head_real = [];
  List<double> alt_ecepted = [];
  List<double> alt_real = [];

  AddToChartButton({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text("Measure Cods"),
          onPressed: () {
            head_excepted.add(
              Provider.of<double>(context, listen: false),
            );
            head_real.add(
              Provider.of<UserLocation>(context, listen: false).head,
            );
            alt_ecepted.add(
              double.parse(
                Provider.of<int>(context, listen: false).toString(),
              ),
            );
            alt_real.add(
              Provider.of<UserLocation>(context, listen: false).altitude,
            );
          },
        ),
        RaisedButton(
            child: Text("Finish"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultChart(
                    head_excepted: this.head_excepted,
                    head_real: this.head_real,
                    alt_ecepted: this.alt_ecepted,
                    alt_real: this.alt_real,
                    id: this.id,
                  ),
                ),
              );
            })
      ],
    );
  }
}
