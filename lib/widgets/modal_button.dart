import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ModalButtonState();
}

class ModalButtonState extends State<ModalButton>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: ShapeDecoration(
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Text(
                    "MockExams",
                    style: GoogleFonts.juliusSansOne(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  RaisedButton(
                    color: Colors.black45,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                     
                      Navigator.pushNamed(context, '/start_exam');
                    },
                    child: Text("Start",
                        style: GoogleFonts.juliusSansOne(
                            textStyle: Theme.of(context).textTheme.display1,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                   Text(
                    "Practice Exams",
                    style: GoogleFonts.juliusSansOne(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  RaisedButton(
                    color: Colors.black45,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                     
                      Navigator.pushNamed(context, '/start_exam');
                    },
                    child: Text("Start",
                        style: GoogleFonts.juliusSansOne(
                            textStyle: Theme.of(context).textTheme.display1,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
