import 'package:birthday_calendar/core/utils/get_day.dart';
import 'package:birthday_calendar/features/home/data/get_days.dart';
import 'package:birthday_calendar/features/home/data/year_get.dart';
import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NextCard extends StatelessWidget {
  final List<BirthdayEvent> users;

  const NextCard({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: double.infinity,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Info(users: users),
          ),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final List<BirthdayEvent> users;

  const Info({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final user = users.first;
    final days = daysUntilDate(user.date);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            AppLocalizations.of(context)!.main_upcoming_birthday,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),

        const Spacer(),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: colorScheme.primaryContainer,
              child: Icon(
                Icons.cake_outlined,
                size: 30,
                color: colorScheme.onPrimaryContainer,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (users.length == 1)
                    Text(
                      user.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  else
                    Text(
                      users.map((e) => e.name).join(", "),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  const SizedBox(height: 8),

                  if (users.length == 1)
                    Text(
                      "${calculateAge(user.date)} ${AppLocalizations.of(context)!.old_years}",
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),

                  const SizedBox(height: 4),

                  if (days == 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.now,
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  else
                    Text(
                      "${AppLocalizations.of(context)!.common_through} $days ${AppLocalizations.of(context)!.through_day}",
                      style: textTheme.bodyMedium,
                    ),

                  const SizedBox(height: 8),

                  Text(
                    "${user.date.day} ${getMonthGenetivus(context, user.date)}",
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const Spacer(),
      ],
    );
  }
}
