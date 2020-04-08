import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> rejectnotice(
    BuildContext context, DocumentSnapshot snapshot) async {
  final controller = TextEditingController();

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('PLEASE ADD A REJECT NOTE'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: controller,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OKAY'),
            onPressed: () async {
              Navigator.of(context).pop();
              Firestore.instance
                  .collection('lesson')
                  .document(snapshot.documentID)
                  .updateData({
                "notice": controller.text.toString(),
                "state": "DECLINED"
              });
            },
          ),
        ],
      );
    },
  );
}
