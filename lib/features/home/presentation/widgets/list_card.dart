import 'package:birthday_calendar/features/home/data/get_day.dart';
import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CardEvent extends StatelessWidget {
  final List<BirthdayEvent> users;

  const CardEvent({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.cake_outlined, size: 48, color: Colors.grey),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.of(context)!.birthdays_empty,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 1,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 250,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return _UserTile(user: users[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _UserTile extends StatelessWidget {
  final BirthdayEvent user;

  const _UserTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Имя + подпись
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  formatDateGenitivus(context, user.date),
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Дата
          Text(
            '${user.date.day}.${user.date.month}',
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),

          const SizedBox(width: 8),

          // Меню (⋮)
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'edit', child: Text('Edit')),
              PopupMenuItem(value: 'delete', child: Text('Delete')),
            ],
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
