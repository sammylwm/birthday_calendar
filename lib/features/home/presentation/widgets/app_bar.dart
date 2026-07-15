import 'package:birthday_calendar/features/login/presentation/login_screen.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(AppLocalizations.of(context)!.main_title),
          Spacer(),
          ElevatedButton(
            onPressed: () async {
              final google = GetIt.I<GoogleSignIn>();
              await google.signOut();
              await google.disconnect();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
            child: Icon(Icons.exit_to_app),
          ),
          Icon(Icons.settings, size: 30),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
