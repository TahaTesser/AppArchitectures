import 'package:flutter/material.dart';
import 'package:flutter_mvcs/commands/refresh_posts_command.dart';
import 'package:flutter_mvcs/models/app_model.dart';
import 'package:flutter_mvcs/models/user_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;

  void _handleRefreshPressed() async {
    setState(() {
      _isLoading = true;
    });

    await RefreshPostsCommand().run(context.read<AppModel>().currentUser!);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var users =
        context.select<UserModel, List<String>>((value) => value.userPosts);

    void Function()? buttonHandler = _isLoading ? null : _handleRefreshPressed;

    var listWidgets = users.map((post) => ListTile(title: Text(post))).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Flexible(child: ListView(children: listWidgets)),
              ElevatedButton(
                onPressed: buttonHandler,
                child: const Text('Refresh'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
