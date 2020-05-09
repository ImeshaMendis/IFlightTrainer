import 'package:flight_training/models/q.dart';
import 'package:flight_training/services/result_service.dart';
import 'package:flight_training/widgets/result_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:flight_training/main.dart';
import 'package:flight_training/screens/student/home_student.dart';
enum Answer { a, b, c, d, ns }

class McqPannel extends StatefulWidget {
  @override
  _McqPannelState createState() => _McqPannelState();
}

class _McqPannelState extends State<McqPannel> {
  List<Answer> answers = List.filled(10, Answer.ns);
  List<Answer> correct = List.filled(10, Answer.ns);
  List<Text> messege = List.filled(10, Text("?",style: TextStyle(color: Colors.blue),));

  void _getCorrectAnswers(List<Q> q) {
    for (int i = 0; i < q.length; i++) {
      if (q[i].correct == "a") {
        correct[i] = Answer.a;
      }
      if (q[i].correct == "b") {
        correct[i] = Answer.b;
      }
      if (q[i].correct == "c") {
        correct[i] = Answer.c;
      }
      if (q[i].correct == "d") {
        correct[i] = Answer.d;
      }
    }
  }

  int _getScore(List<Answer> a, List<Answer> correct) {
    int correctAnswers = 0;
    for (int i = 0; i < 10; i++) {
      if (a[i] == correct[i]) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  @override
  Widget build(BuildContext context) {
    List<Q> mcqList = Provider.of<List<Q>>(context);
    // int result = Provider.of<int>(context);

    _getCorrectAnswers(mcqList);
    return (mcqList == null)
        ? Text("not Strted")
        : Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              isMockExam
                  ? Padding(
                      padding: EdgeInsets.all(10),
                      child: SlideCountdownClock(
                        duration: Duration(days: 0, minutes: 5),
                        slideDirection: SlideDirection.Up,
                        separator: "-",
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        separatorTextStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey, shape: BoxShape.circle),
                        onDone: () {
                          //_scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Clock 1 finished')));
                        },
                      ),
                    )
                  : Text(''),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.arrow_left,color: Colors.white,),
                      Icon(Icons.arrow_right,color:Colors.white)
                    ]
                  ),
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mcqList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      mcqList[index].q,
                                      style: GoogleFonts.juliusSansOne(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .display1,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20, bottom: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          mcqList[index].a,
                                          style: GoogleFonts.juliusSansOne(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .display1,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        leading: Radio(
                                          activeColor: Colors.white,
                                          value: Answer.a,
                                          groupValue: answers[index],
                                          onChanged: (Answer value) {
                                            setState(
                                              () {
                                                answers[index] = value;
                                                if (value == correct[index]) {
                                                  messege[index] = Text(
                                                      "Correct",
                                                      style: TextStyle(
                                                          color: Colors.green));
                                                } else {
                                                  messege[index] = Text(
                                                      "Incorrect: " +
                                                          correct[index]
                                                              .toString() +
                                                          " is Correct",
                                                      style: TextStyle(
                                                          color: Colors.red));
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20, bottom: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          mcqList[index].b,
                                          style: GoogleFonts.juliusSansOne(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .display1,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        leading: Radio(
                                          activeColor: Colors.white,
                                          value: Answer.b,
                                          groupValue: answers[index],
                                          onChanged: (Answer value) {
                                            setState(
                                              () {
                                                answers[index] = value;
                                                if (value == correct[index]) {
                                                  messege[index] = Text(
                                                      "Correct",
                                                      style: TextStyle(
                                                          color: Colors.green));
                                                } else {
                                                  messege[index] = Text(
                                                      "Incorrect: " +
                                                          correct[index]
                                                              .toString() +
                                                          " is Correct",
                                                      style: TextStyle(
                                                          color: Colors.red));
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20, bottom: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          mcqList[index].c,
                                          style: GoogleFonts.juliusSansOne(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .display1,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        leading: Radio(
                                          activeColor: Colors.white,
                                          value: Answer.c,
                                          groupValue: answers[index],
                                          onChanged: (Answer value) {
                                            setState(
                                              () {
                                                answers[index] = value;
                                                if (value == correct[index]) {
                                                  messege[index] = Text(
                                                      "Correct",
                                                      style: TextStyle(
                                                          color: Colors.green));
                                                } else {
                                                  messege[index] = Text(
                                                      "Incorrect: " +
                                                          correct[index]
                                                              .toString() +
                                                          " is Correct",
                                                      style: TextStyle(
                                                          color: Colors.red));
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20, bottom: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          mcqList[index].d,
                                          style: GoogleFonts.juliusSansOne(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .display1,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        leading: Radio(
                                          activeColor: Colors.white,
                                          value: Answer.d,
                                          groupValue: answers[index],
                                          onChanged: (Answer value) {
                                            setState(
                                              () {
                                                answers[index] = value;
                                                if (value == correct[index]) {
                                                  messege[index] = Text(
                                                      "Correct",
                                                      style: TextStyle(
                                                          color: Colors.green));
                                                } else {
                                                  messege[index] = Text(
                                                      "Incorrect: " +
                                                          correct[index]
                                                              .toString() +
                                                          " is Correct",
                                                      style: TextStyle(
                                                          color: Colors.red));
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        isMockExam
                            ? Text("")
                            : Chip(
                                label: messege[index],
                                backgroundColor: Colors.white),
                        SizedBox(height: 20,)                        
                      ],
                    );
                  },
                ),
              ),
              RaisedButton(
                color: Colors.black45,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                 isMockExam? showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => ResultModal(
                      result: _getScore(answers, correct),
                    ),
                  ): Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeStudent()),
                        (Route<dynamic> route) => false,
                      );
                },
                child: Text(isMockExam ?"Submit":"Exit",
                    style: GoogleFonts.juliusSansOne(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              )
            ],
          );
  }
}
