import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      title: Row(
        children: [
          Text(AppLocalizations.of(context)!.all_title),
          Spacer(),
          PopupMenuButton<String>(
            iconColor: colorScheme.onSurfaceVariant,
            onSelected: (value) {},
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'edit',
                child: Text(AppLocalizations.of(context)!.edit),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Text(AppLocalizations.of(context)!.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
