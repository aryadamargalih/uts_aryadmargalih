import 'package:flutter/material.dart';

class CounterController with ChangeNotifier {
  int counter = 0;

  void incrementadd() {
    counter++;
    notifyListeners();
  }

  void incrementremove() {
    counter--;
    notifyListeners();
  }
}
