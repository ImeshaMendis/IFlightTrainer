import 'dart:async';

class AltPassService {
  static StreamController<int> _altPassController =
      StreamController<int>.broadcast();

  Stream<int> get altPassStream => _altPassController.stream;

  static void addaltPass(int res) {
    _altPassController.add(res);
  }
}
