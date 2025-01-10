import 'package:flutter/material.dart';
import 'package:login_app/screens/home_screen.dart';
import 'package:login_app/screens/login_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    // ignore: prefer_const_constructors
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(
        username: ModalRoute.of(context)?.settings.arguments as String),
  };
}
