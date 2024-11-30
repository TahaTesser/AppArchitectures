import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  List<String> _userPosts = [];
  List<String> get userPosts => _userPosts;
  set userPosts(List<String> value) {
    if (_userPosts == value) {
      return;
    }
    _userPosts = value;
    notifyListeners();
  }
}
