import 'base_command.dart';

class RefreshPostsCommand extends BaseCommand {
  Future<List<String>> run(String user) async {
    List<String> posts = await userService.getPosts(user);
    userModel.userPosts = posts;

    return posts;
  }
}
