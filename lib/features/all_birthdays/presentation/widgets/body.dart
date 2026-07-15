import 'package:birthday_calendar/features/all_birthdays/presentation/bloc/cubit.dart';
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
          Text("empty");
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
