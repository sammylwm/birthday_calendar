import 'package:birthday_calendar/features/all_birthdays/presentation/bloc/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return Text(events.entries.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
