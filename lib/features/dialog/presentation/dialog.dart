import 'package:birthday_calendar/features/dialog/presentation/bloc/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/body.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  const AddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.add_contact_title),
        ),
        body: Body(),
      ),
    );
  }
}
