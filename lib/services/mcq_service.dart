import 'package:flutter/services.dart';

class McqService {
  static Future<String> loadAsset() async {
    try {
      return await rootBundle.loadString('lib/utils/mcq.json');
    } catch (e) {
      print("error read dara");
    }
  }
}
