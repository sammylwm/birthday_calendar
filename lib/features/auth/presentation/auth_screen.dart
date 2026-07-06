import 'package:birthday_calendar/features/auth/presentation/bloc/cubit.dart';
import 'package:birthday_calendar/features/home/presentation/home_screen.dart';
import 'package:birthday_calendar/features/login/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit()..checkLogin(),
      child: const MaterialApp(home: AuthGate()),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        switch (state) {
          case AuthLoading():
            return const Center(child: CircularProgressIndicator());

          case AuthAuthenticated():
            return const HomeScreen();

          case AuthUnauthenticated():
            return const LoginScreen();
          case AuthInitial():
            return Text('test');
        }
      },
    );
  }
}
