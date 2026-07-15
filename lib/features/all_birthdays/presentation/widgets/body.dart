import 'package:birthday_calendar/features/all_birthdays/presentation/bloc/cubit.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'month_list.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllCubit, AllState>(
      listener: (context, state) {
        if (state is AllError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is AllLoaded) {
          final events = state.events;

          return ListView.separated(
            itemCount: events.length,
            padding: const EdgeInsets.all(8.0),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, index) {
              final entry = events.entries.elementAt(index);

              return MonthList(month: entry.key, events: entry.value);
            },
          );
        }
        if (state is AllEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.cake_outlined, size: 64),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)!.empty_birthdays_subtitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.empty_birthdays_subtitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
