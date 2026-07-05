import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'calendar.dart';
import 'login_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  GoogleSignInAccount? _user;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await _googleSignIn.initialize(
      serverClientId:
          "611671590619-8mbjaqesr8hf6idg9ifmlet0qivhuu95.apps.googleusercontent.com",
    );

    _googleSignIn.authenticationEvents.listen((event) {
      setState(() {
        _user = switch (event) {
          GoogleSignInAuthenticationEventSignIn() => event.user,
          _ => null,
        };
      });
    });

    await _googleSignIn.attemptLightweightAuthentication();

    setState(() => _ready = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_user == null) {
      return LoginScreen(onLogin: _login);
    }

    return CalendarScreen(user: _user!);
  }

  Future<void> _login() async {
    await _googleSignIn.authenticate();
  }
}