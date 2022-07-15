import 'package:flutter/foundation.dart';

class CounterState with ChangeNotifier {
  int counter = 0;

  void update() {
    notifyListeners();
  }
}
