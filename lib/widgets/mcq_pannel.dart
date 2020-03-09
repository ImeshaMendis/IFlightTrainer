import 'package:flight_training/models/q.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Answer { a, b, c, d, ns }

class McqPannel extends StatefulWidget {
  @override
  _McqPannelState createState() => _McqPannelState();
}

class _McqPannelState extends State<McqPannel> {
  List<Answer> answers= List.filled(10, Answer.ns);

  @override
  
  @override
  Widget build(BuildContext context) {
    List<Q> mcqList = Provider.of<List<Q>>(context);
        return Container(
          child: Center(
            child: (mcqList == null)
                ? Text("not Strted")
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: mcqList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.blue,
                          child: Column(
                            children: <Widget>[
                              Text(mcqList[index].q),
                              ListTile(
                                title: Text(mcqList[index].a),
                                leading: Radio(
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
                              ListTile(
                                title: Text(mcqList[index].b),
                                leading: Radio(
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
                              ListTile(
                                title: Text(mcqList[index].c),
                                leading: Radio(
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
                              ListTile(
                                title: Text(mcqList[index].d),
                                leading: Radio(
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
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        );
      }
    
//       void creteCorrectList(List<Q> q) {


//         for(int i=0;i<q.length;i++){
//           if(q[i].correct=="a"){
//             corrects.add(Answer.a);
//           }
          
//           if(q[i].correct=="b"){
//             corrects.add(Answer.b);
//           }
          
//           if(q[i].correct=="c"){
//             corrects.add(Answer.c);
//           }
          
//           if(q[i].correct=="d"){
//             corrects.add(Answer.d);
//           }
//         }

//         print(corrects.toList());
//       }
// }

// SingingCharacter _character = SingingCharacter.lafayette;

//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         ListTile(
//           title: const Text('Lafayette'),
//           leading: Radio(
//             value: SingingCharacter.lafayette,
//             groupValue: _character,
//             onChanged: (SingingCharacter value) {
//               setState(() {
//                 _character = value;
//               });
//             },
//           ),
//         ),
//         ListTile(
//           title: const Text('Thomas Jefferson'),
//           leading: Radio(
//             value: SingingCharacter.jefferson,
//             groupValue: _character,
//             onChanged: (SingingCharacter value) {
//               setState(() {
//                 _character = value;
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
