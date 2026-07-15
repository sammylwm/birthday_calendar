import 'package:birthday_calendar/core/utils/user_card.dart';
import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CardEvent extends StatelessWidget {
  final List<BirthdayEvent> users;

  const CardEvent({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (users.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cake_outlined, size: 48, color: colorScheme.outline),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.of(context)!.birthdays_empty,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: users.length,
          separatorBuilder: (_, __) =>
              Divider(height: 24, color: colorScheme.outlineVariant),
          itemBuilder: (context, index) {
            return UserTile(user: users[index]);
          },
        ),
      ),
    );
  }
}
