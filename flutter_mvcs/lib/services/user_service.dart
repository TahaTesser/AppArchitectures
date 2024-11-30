import 'dart:math';

class UserService {
  Future<bool> login(String user, String pass) async {
    await Future<void>.delayed(Duration(seconds: 1));
    return true;
  }

  Future<List<String>> getPosts(String user) async {
    await Future<void>.delayed(Duration(seconds: 1));
    return List.generate(50, (_) => "Post - ${Random().nextInt(999)}");
  }
}
