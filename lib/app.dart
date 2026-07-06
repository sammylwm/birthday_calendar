import 'package:birthday_calendar/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'features/auth/presentation/auth_screen.dart';
import 'themes/my_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final textTheme = ThemeData.light().textTheme;

    final materialTheme = MaterialTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: AuthScreen(),
    );
  }
}
