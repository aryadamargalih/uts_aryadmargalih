import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_aryadamargalih/controllers/auth_controller.dart';
import 'package:uts_aryadamargalih/controllers/counter_controller.dart';
import 'package:uts_aryadamargalih/view/login.dart';
import 'package:uts_aryadamargalih/view/Dashboard.dart';
import 'package:uts_aryadamargalih/view/counter_page.dart';
import 'package:uts_aryadamargalih/view/profile.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/profile': (context) => const Profile(),
        '/dashboard': (context) => const Dashboard(),
        '/counter': (context) => const CounterPage(),
      },
    );
  }
}
