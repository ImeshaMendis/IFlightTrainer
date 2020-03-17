class Date {
  final String date;
  bool isAvailble = false;

  Date({this.date});

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      date: json['date'],
    );
  }
}
