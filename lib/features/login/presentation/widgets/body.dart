import 'package:birthday_calendar/features/home/presentation/home_screen.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/cubit.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }

        if (state is LoginError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }

        if (state is LoginCancelled) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Login cancelled")));
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
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
                  AppLocalizations.of(context)!.appname,
                  style: const TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                Text(
                  AppLocalizations.of(context)!.sign_hello,
                  textAlign: TextAlign.center,
                ),

                const Spacer(),

                ElevatedButton(
                  onPressed: () {
                    context.read<LoginCubit>().login();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/google.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(AppLocalizations.of(context)!.entrance),
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
