import 'package:flutter/material.dart';
import 'package:login_app/screens/home_screen.dart';
import 'package:login_app/screens/login_screen.dart';
import 'package:login_app/screens/parent/parent_home_screen.dart';
import 'package:login_app/screens/student/student_home_screen.dart';

import 'screens/teacher/teacher_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rendimiento Escolar',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/student_home': (context) =>
            const StudentHomeScreen(username: 'Estudiante'),
        '/parent_home': (context) => const ParentHomeScreen(username: 'Padre'),
        '/teacher_home': (context) =>
            const TeacherHomeScreen(username: 'Profesor'),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final username = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => HomeScreen(username: username),
          );
        }
        return null;
      },
    );
  }
}
