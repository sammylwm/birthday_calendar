import 'package:birthday_calendar/features/home/data/get_day.dart';
import 'package:birthday_calendar/features/home/data/get_days.dart';
import 'package:birthday_calendar/features/home/data/year_get.dart';
import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NextCard extends StatelessWidget {
  final BirthdayEvent user;

  const NextCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: double.infinity,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Info(user: user),
          ),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final BirthdayEvent user;

  const Info({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.main_upcoming_birthday,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            const Icon(Icons.cake_outlined, size: 56),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "${calculateAge(user.date)} ${AppLocalizations.of(context)!.old_years}",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 4),
                  Text(
                    "${AppLocalizations.of(context)!.common_through} ${daysUntilDate(user.date)} ${AppLocalizations.of(context)!.through_day}",
                  ),

                  const SizedBox(height: 6),

                  Text(
                    formatDateGenitivus(context, user.date),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
