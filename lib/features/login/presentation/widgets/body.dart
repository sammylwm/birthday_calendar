import 'package:birthday_calendar/features/bloc/cubit.dart';
import 'package:birthday_calendar/features/home/presentation/home_screen.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Bubit, BirthdayState>(
      listenWhen: (previous, current) =>
          previous.authStatus != current.authStatus,
      buildWhen: (previous, current) =>
          previous.authStatus != current.authStatus,
      listener: (context, state) {
        switch (state.authStatus) {
          case AuthStatus.authenticated:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
            break;

          default:
            break;
        }
      },
      builder: (context, state) {
        if (state.authStatus == AuthStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.cake, size: 100),
                const SizedBox(height: 16),

                Text(
                  AppLocalizations.of(context)!.login_title,
                  style: const TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                Text(
                  AppLocalizations.of(context)!.login_subtitle,
                  textAlign: TextAlign.center,
                ),

                const Spacer(),

                ElevatedButton(
                  onPressed: () {
                    context.read<Bubit>().login();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/google.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(AppLocalizations.of(context)!.login_google_button),
                    ],
                  ),
                ),

                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
