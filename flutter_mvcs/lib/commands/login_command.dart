import 'package:flutter_mvcs/commands/refresh_posts_command.dart';

import 'base_command.dart';

class LoginCommand extends BaseCommand {
  Future<bool> run(String user, String pass) async {
    bool loginSuccess = await userService.login(user, pass);

    if (loginSuccess) {
      await RefreshPostsCommand().run(user);
    }

    appModel.currentUser = loginSuccess ? user : null;

    return loginSuccess;
  }
}
