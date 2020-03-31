

import 'package:flight_training/utils/states.dart';

class Lesson {
  final String date;
  final String lessonId;
  String time = "Set Time";
  LessonState state; 
  Lesson({this.date, this.lessonId, this.state});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
        date: json['date'] as String, lessonId: json['lessonId'] as String, state: json['lessonState']);
  }
}
