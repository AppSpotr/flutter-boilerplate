import 'package:flutter/foundation.dart';

class NavigationState with ChangeNotifier {
  int selectedIndex = 0;

  void update() {
    notifyListeners();
  }
}
