import 'package:birthday_calendar/core/utils/dialog_deleted.dart';
import 'package:birthday_calendar/core/utils/edit.dart';
import 'package:birthday_calendar/core/utils/get_day.dart';
import 'package:birthday_calendar/features/bloc/cubit.dart';
import 'package:birthday_calendar/features/home/data/year_get.dart';
import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTile extends StatelessWidget {
  final BirthdayEvent user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(
              Icons.cake,
              color: colorScheme.onPrimaryContainer,
              size: 20,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1,
                  ),
                ),

                const SizedBox(height: 3),

                if (calculateAge(user.date) > 0)
                  Text(
                    "${calculateAge(user.date)} ${AppLocalizations.of(context)!.old_years}",
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 13,
                    ),
                  ),

                const SizedBox(height: 2),

                Text(
                  getMonthGenetivus(context, user.date.month, user.date.day),
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.outline,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          PopupMenuButton<String>(
            iconColor: colorScheme.onSurfaceVariant,

            onSelected: (value) async {
              if (value == 'delete') {
                final confirmed = await showDeleteDialog(context, user.name);

                if (confirmed && context.mounted) {
                  context.read<Bubit>().delete(user.id);
                }
              } else if (value == "edit") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<Bubit>(),
                      child: EditDialog(user: user),
                    ),
                  ),
                );
              }
            },

            itemBuilder: (context) => [
              PopupMenuItem(
                value: "edit",
                child: Text(AppLocalizations.of(context)!.edit),
              ),

              PopupMenuItem(
                value: "delete",
                child: Text(AppLocalizations.of(context)!.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
