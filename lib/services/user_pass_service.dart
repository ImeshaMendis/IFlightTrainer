import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserPassService {
  static StreamController<DocumentSnapshot> _userPassController =
      StreamController<DocumentSnapshot>.broadcast();

  Stream<DocumentSnapshot> get userPassStream => _userPassController.stream;

  static void addUser(DocumentSnapshot res) {
    print(res.documentID); 
    _userPassController.add(res);
  }
}
