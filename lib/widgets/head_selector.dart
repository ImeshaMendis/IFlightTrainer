import 'package:flight_training/services/head_pass_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeadSelector extends StatelessWidget {
  const HeadSelector({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleCircularSlider(
      300,
      0,
      height: 175,
      width: 175,
      handlerOutterRadius: 10.0,
      baseColor: Colors.blueGrey,
      selectionColor: Colors.lightBlue,
      onSelectionChange: (int i, int j, int k) {
        double value = j * 360 / 300.0;
        HeadPassService.addheadPass(value);
      },
      child: Center(
          child: Text(
        Provider.of<double>(context).toString() + "°",
        style: GoogleFonts.juliusSansOne(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 35,
            fontWeight: FontWeight.w700,
            color: Colors.blue),
      )),
    );
  }
}