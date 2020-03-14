import 'package:flight_training/models/q.dart';
import 'package:flight_training/services/mcq_service.dart';
import 'package:flight_training/services/result_service.dart';
import 'package:flight_training/widgets/mcq_pannel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Exam extends StatefulWidget {
  @override
  _ExamState createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  @override
  void initState() {
    McqService.getRandomMcqs();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: MultiProvider(
          child: McqPannel(),
          providers: [
            StreamProvider<List<Q>>(
                create: (context) => McqService().mcqStream),
            StreamProvider<int>(
                create: (context) => ResultService().resultStream),
          ],
        ),
      ),
    );
  }
}
