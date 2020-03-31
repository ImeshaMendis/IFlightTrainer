import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> notice(
    BuildContext context, DocumentSnapshot snapshot) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('NOTICE'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(snapshot.data['notice']),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OKAY'),
            onPressed: () async {
              Navigator.of(context).pop();
              await Firestore.instance
                  .collection('lesson')
                  .document(snapshot.documentID)
                  .delete();
            },
          ),
        ],
      );
    },
  );
}
