import 'dart:async';
import 'package:flight_training/models/q.dart';
import 'package:flight_training/utils/mcq_generator.dart';
import 'package:flutter/services.dart';

class McqService {



  
  static StreamController<List<Q>> _mcqController =
      StreamController<List<Q>>.broadcast();

  Stream<List<Q>> get mcqStream => _mcqController.stream;


   Future<String> loadAsset() async {
    try {
      return await rootBundle.loadString('lib/utils/mcq.json');
    } catch (e) {
      print("error read data");
    }
  }

    static void getRandomMcqs(){
     McqGenerator.genRandomMcqs().then((mcqs){
        if(mcqs!=null){
            _mcqController.add(mcqs);
        }
     });
   }
  
}
