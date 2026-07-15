import 'package:birthday_calendar/features/all_birthdays/presentation/bloc/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/app_bar.dart';
import 'widgets/body.dart';

class AllBirthdaysScreen extends StatelessWidget {
  const AllBirthdaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllCubit(),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Body(),
          ),
        ),
      ),
    );
  }
}
