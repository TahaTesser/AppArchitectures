import 'package:flutter/material.dart';
import 'package:flutter_mvcs/models/app_model.dart';
import 'package:flutter_mvcs/models/user_model.dart';
import 'package:flutter_mvcs/services/user_service.dart';
import 'package:provider/provider.dart';

import 'commands/base_command.dart' as commands;
import 'views/home_page.dart';
import 'views/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppModel()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        Provider(create: (_) => UserService()),
      ],
      child: Builder(builder: (context) {
        commands.init(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AppScaffold(),
        );
      }),
    );
  }
}

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    String? currentUser =
        context.select<AppModel, String?>((value) => value.currentUser);

    return Scaffold(
      body: currentUser != null ? HomePage() : LoginPage(),
    );
  }
}
