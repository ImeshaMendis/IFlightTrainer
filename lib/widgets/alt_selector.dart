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
              FlutterSliderFixedValue(percent: 0, value: "0"),
              FlutterSliderFixedValue(percent: 10, value: "100"),
              FlutterSliderFixedValue(percent: 20, value: "200"),
              FlutterSliderFixedValue(percent: 30, value: "300"),
              FlutterSliderFixedValue(percent: 40, value: "400"),
              FlutterSliderFixedValue(percent: 50, value: "500"),
              FlutterSliderFixedValue(percent: 60, value: "600"),
              FlutterSliderFixedValue(percent: 70, value: "700"),
              FlutterSliderFixedValue(percent: 80, value: "800"),
              FlutterSliderFixedValue(percent: 90, value: "9000"),
              FlutterSliderFixedValue(percent: 100, value: "1000"),
            ],
          ),
        ),
      ],
    );
  }
}
