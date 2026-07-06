import 'package:birthday_calendar/features/home/presentation/bloc/cubit.dart';
import 'next_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeLoaded) {
          final next = state.next;
          final inMonth = state.inMonth;
          return Column(children: [NextCard(user: next)]);

          //   Text(next.toString());
          //   if (inMonth.isEmpty) {
          //     return Text("ничего нет");
          //   }
          //   return ListView.builder(
          //     itemCount: inMonth.length,
          //     itemBuilder: (context, index) {
          //       final event = inMonth[index];

          //       return ListTile(
          //         title: Text(event.name),
          //         subtitle: Text(event.date.toString()),
          //       );
          //     },
          //   );
        }
        return Text('hello');
      },
    );
  }
}
