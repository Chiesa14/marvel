import 'package:flutter/material.dart';

class NavController with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  // Change the current tab and notify listeners
  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
