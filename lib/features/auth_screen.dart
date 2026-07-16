import 'package:birthday_calendar/features/bloc/cubit.dart';
import 'package:birthday_calendar/features/login/presentation/login_screen.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:birthday_calendar/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Bubit()..checkLogin(),
      child: const AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<Bubit, BirthdayState>(
      listenWhen: (previous, current) =>
          previous.error != current.error && current.error != null ||
          previous.deleting != current.deleting,
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!)));
        }
        if (state.deleted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.deleted)),
          );
        }
      },
      child: BlocBuilder<Bubit, BirthdayState>(
        builder: (context, state) {
          switch (state.authStatus) {
            case AuthStatus.loading:
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );

            case AuthStatus.authenticated:
              return const MainNavigation();

            case AuthStatus.unauthenticated:
              return const LoginScreen();

            case AuthStatus.unknown:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
