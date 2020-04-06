import 'dart:async';

class DatePassService {
  static StreamController<int> _datePassController =
      StreamController<int>.broadcast();

  Stream<int> get datePassStream => _datePassController.stream;

  static void adddatePass(int res) {
    print(res);
    _datePassController.add(res);
  }
}
