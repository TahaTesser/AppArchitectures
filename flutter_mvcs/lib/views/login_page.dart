import 'package:flutter/material.dart';
import 'package:flutter_mvcs/commands/login_command.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  void _handleLoginPressed() async {
    setState(() {
      _isLoading = true;
    });
    bool success = await LoginCommand().run("user", "pass");
    if (!success) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _handleLoginPressed,
                child: const Text('Login'),
              ),
      ),
    );
  }
}
