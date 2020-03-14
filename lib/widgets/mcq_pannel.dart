import 'package:flight_training/models/q.dart';
import 'package:flight_training/services/result_service.dart';
import 'package:flight_training/widgets/result_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

enum Answer { a, b, c, d, ns }

class McqPannel extends StatefulWidget {
  @override
  _McqPannelState createState() => _McqPannelState();
}

class _McqPannelState extends State<McqPannel> {
  List<Answer> answers = List.filled(10, Answer.ns);
  List<Answer> correct = List.filled(10, Answer.ns);

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
    int result = Provider.of<int>(context);

    _getCorrectAnswers(mcqList);
    return (mcqList == null)
        ? Text("not Strted")
        : Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mcqList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  mcqList[index].q,
                                  style: GoogleFonts.juliusSansOne(
                                    textStyle:
                                        Theme.of(context).textTheme.display1,
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
                    );
                  },
                ),
              ),
              RaisedButton(
                color: Colors.black45,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => ResultModal(
                      result: _getScore(answers, correct),
                    ),
                  );
                },
                child: Text("Submit",
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
