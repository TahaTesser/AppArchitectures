import 'package:flutter/material.dart';
import 'package:flutter_mvcs/models/app_model.dart';
import 'package:flutter_mvcs/models/user_model.dart';
import 'package:flutter_mvcs/services/user_service.dart';
import 'package:provider/provider.dart';

late BuildContext _mainContext;

void init(BuildContext context) => _mainContext = context;

class BaseCommand {
  // Models
  UserModel userModel = _mainContext.read();
  AppModel appModel = _mainContext.read();
  // Services
  UserService userService = _mainContext.read();
}
