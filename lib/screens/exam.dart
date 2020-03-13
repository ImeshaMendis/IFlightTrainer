import 'package:flight_training/services/mcq_service.dart';
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
        child: StreamProvider(
          child: McqPannel(),
          create: (BuildContext context)=>McqService().mcqStream,
        ),
      ),
    );
  }
}
