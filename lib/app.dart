import 'package:birthday_calendar/features/auth/presentation/auth_screen.dart';
import 'package:flutter/cupertino.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AuthScreen();
  }
}
