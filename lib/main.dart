import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_app/providers/authentication_provider.dart';
import 'package:login_app/screens/home_screen.dart';
import 'package:login_app/screens/login_screen.dart';
import 'package:login_app/screens/parent/parent_home_screen.dart';
import 'package:login_app/screens/student/student_home_screen.dart';
import 'package:login_app/screens/teacher/teacher_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Asegúrate de inicializar Firebase aquí
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
      child: const MyApp(),
    ),
  );
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
        '/student_home': (context) => const StudentHomeScreen(),
        '/parent_home': (context) => const ParentHomeScreen(),
        '/teacher_home': (context) => const TeacherHomeScreen(),
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
