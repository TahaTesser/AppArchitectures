import 'package:flutter/foundation.dart';

class AppModel extends ChangeNotifier {
  String? _currentUser;
  String? get currentUser => _currentUser;
  set currentUser(String? value) {
    if (_currentUser == value) {
      return;
    }
    _currentUser = value;
    notifyListeners();
  }
}
