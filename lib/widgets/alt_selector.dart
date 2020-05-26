import 'package:flight_training/services/alt_pass_service.dart';
import 'package:flight_training/services/head_pass_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class AltSelector extends StatelessWidget {
  const AltSelector({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 150,
          height: 400,
          child: FlutterSlider(
            onDragCompleted: (k, l, j) {
              AltPassService.addaltPass(int.parse(l));
            },
            rtl: true,
            axis: Axis.vertical,
            values: [10],
            fixedValues: [
              FlutterSliderFixedValue(percent: 0, value: "0ft"),
              FlutterSliderFixedValue(percent: 10, value: "500ft"),
              FlutterSliderFixedValue(percent: 20, value: "1500ft"),
              FlutterSliderFixedValue(percent: 30, value: "2000ft"),
              FlutterSliderFixedValue(percent: 40, value: "2500ft"),
              FlutterSliderFixedValue(percent: 50, value: "3000ft"),
              FlutterSliderFixedValue(percent: 60, value: "3500ft"),
              FlutterSliderFixedValue(percent: 70, value: "4000ft"),
              FlutterSliderFixedValue(percent: 80, value: "4500ft"),
              FlutterSliderFixedValue(percent: 90, value: "5000ft"),
              FlutterSliderFixedValue(percent: 100, value: "5500ft"),
            ],
          ),
        ),
      ],
    );
  }
}
