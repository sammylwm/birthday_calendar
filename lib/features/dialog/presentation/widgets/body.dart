import 'package:birthday_calendar/features/bloc/cubit.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  DateTime? birthday;

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        birthday = date;
      });
    }
  }

  String get name => [
    nameController.text.trim(),
    surnameController.text.trim(),
  ].where((e) => e.isNotEmpty).join(' ');

  @override
  void initState() {
    super.initState();

    nameController.addListener(() {
      setState(() {});
    });

    surnameController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Bubit, BirthdayState>(
      listenWhen: (p, c) => p.added != c.added && c.added,
      listener: (context, state) {
        if (state.added) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.add_ready)),
          );

          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state.adding) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(
                    context,
                  )!.add_contact_name_label,
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: surnameController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(
                    context,
                  )!.add_contact_lastname_label,
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),

              InkWell(
                onTap: pickDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(
                      context,
                    )!.add_contact_birthday_label,
                    border: OutlineInputBorder(),
                  ),
                  child: Text(
                    birthday == null
                        ? AppLocalizations.of(
                            context,
                          )!.add_contact_birthday_placeholder
                        : "${birthday!.day}.${birthday!.month}.${birthday!.year}",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed:
                      birthday == null || nameController.text.trim().isEmpty
                      ? null
                      : () {
                          context.read<Bubit>().add(name, birthday!);
                        },
                  child: Text(AppLocalizations.of(context)!.add),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    super.dispose();
  }
}
