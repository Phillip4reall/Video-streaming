import "package:flutter/material.dart";

class MainSreenNotifiers extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  set padeIndex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }
}
