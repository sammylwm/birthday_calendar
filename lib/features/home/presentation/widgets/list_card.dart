import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:flutter/material.dart';

class CardEvent extends StatelessWidget {
  final List<BirthdayEvent> users;

  const CardEvent({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return Text('null');
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
          child: Column(
            children: users.map((user) => _UserTile(user: user)).toList(),
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
                const Text(
                  'День рождения',
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
