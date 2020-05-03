import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_training/screens/charts/report_page.dart';
import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  final DocumentSnapshot snapshot;
  const Report({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ReportPage(
      snapshot: this.snapshot,
    );
    // return Text(snapshot.data["headR"].toString());
  }
}
