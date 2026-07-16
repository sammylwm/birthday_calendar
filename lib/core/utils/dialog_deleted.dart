import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

Future<bool> showDeleteDialog(BuildContext context, String name) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(AppLocalizations.of(context)!.delete),
        content: Text(
          AppLocalizations.of(context)!.delete_contact_confirmation(name),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(AppLocalizations.of(context)!.delete),
          ),
        ],
      );
    },
  );

  return result ?? false;
}
