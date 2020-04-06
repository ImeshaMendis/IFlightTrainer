import 'dart:async';

class HeadPassService {
  static StreamController<double> _headPassController =
      StreamController<double>.broadcast();

  Stream<double> get headPassStream => _headPassController.stream;

  static void addheadPass(double res) {
    
    _headPassController.add(res);
  }
}
