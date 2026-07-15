import 'package:birthday_calendar/core/utils/get_day.dart';
import 'package:birthday_calendar/core/utils/user_card.dart';
import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:flutter/material.dart';

class MonthList extends StatelessWidget {
  final int month;
  final List<BirthdayEvent> events;

  const MonthList({super.key, required this.month, required this.events});
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " ${getMonthNominativus(context, month)}",
          style: const TextStyle(fontSize: 18),
        ),

        Card(
          elevation: 0,
          color: colorScheme.surfaceContainerLow,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.hardEdge,

          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                for (int i = 0; i < events.length; i++) ...[
                  UserTile(user: events[i]),

                  if (i != events.length - 1)
                    Divider(height: 24, color: colorScheme.outlineVariant),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
