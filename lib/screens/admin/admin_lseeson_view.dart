import 'package:flight_training/models/user_location.dart';
import 'package:flight_training/services/alt_pass_service.dart';
import 'package:flight_training/services/head_pass_service.dart';
import 'package:flight_training/services/location_service.dart';
import 'package:flight_training/widgets/alt_selector.dart';
import 'package:flight_training/widgets/head_selector.dart';
import 'package:flight_training/widgets/map_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AdminLessonView extends StatefulWidget {
  @override
  _AdminLessonViewState createState() => _AdminLessonViewState();
}

class _AdminLessonViewState extends State<AdminLessonView> {
  HeadPassService hs = HeadPassService();
  AltPassService als = AltPassService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Take Off"),
      ),
      body: StreamProvider<UserLocation>(
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
                child: AddToChartButton(),
              ),
              RaisedButton(
                onPressed: () => {
                  Navigator.pushNamed(context, '/result_chart'),
                },
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
  const AddToChartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Measure Cods"),
      onPressed: () {
        print(Provider.of<double>(context, listen: false));
        print(Provider.of<int>(context, listen: false));
        print(Provider.of<UserLocation>(context, listen: false).head);
      },
    );
  }
}
