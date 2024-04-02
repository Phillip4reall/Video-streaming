import "package:flutter/material.dart";

class MainSreenNotifiers extends ChangeNotifier {
  int _pageIndex = 0;
  String _player = 'video/video1.mp4';
  String get player => _player;
  int get pageIndex => _pageIndex;

  set padeIndex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }

  set player(String newIndex) {
    _player = newIndex;
    notifyListeners();
  }
}
