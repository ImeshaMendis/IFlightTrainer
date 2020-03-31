import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<String>> getAvailbeDates() async {
  
  var firestore = Firestore.instance;
  try {
    QuerySnapshot collectionSnapshot =
        await firestore.collection('date').getDocuments();
    var templist = collectionSnapshot.documents;
    var list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data['date'].toString();
    }).toList();
    print("COMPLETED");
    return list;
  } catch (e) {
    print(e.toString());
    return null;
  }
}
