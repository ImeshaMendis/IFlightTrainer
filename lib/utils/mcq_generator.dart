import 'dart:convert';

import 'package:flight_training/models/q.dart';
import 'package:flight_training/services/mcq_service.dart';

// random 10 mcq list
class McqGenerator {
  static Future<List<Q>> genRandomMcqs() async {
    try {
      final jsonData = jsonDecode(await McqService().loadAsset()) as List;
      List<Q> qList = jsonData.map((q) => Q.fromJson(q)).toList();
      List<Q> randomQList = [];
      List list = List.generate(qList.length, (i) => i);
      list.shuffle();
      for (int i = 0; i < 10; i++) {
        randomQList.insert(i, qList[list[i]]);
      }
      print(randomQList.toString());
      return randomQList;
    } catch (e) {
      print(e.toString());
    }
  }
}
