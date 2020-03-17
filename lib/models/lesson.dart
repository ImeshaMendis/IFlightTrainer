class Lesson {
  final String date;
  final String lessonId;
  String time = "Set Time";
  Lesson({this.date, this.lessonId});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
        date: json['date'] as String, lessonId: json['lessonId'] as String);
  }
}
