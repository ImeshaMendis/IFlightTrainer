import 'dart:async';

class ResultService {
  static StreamController<int> _resultController =
      StreamController<int>.broadcast();

  Stream<int> get resultStream => _resultController.stream;

  static void addResult(int res) {
    _resultController.add(res);
  }
}
