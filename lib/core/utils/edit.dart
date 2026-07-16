import 'package:birthday_calendar/features/bloc/cubit.dart';
import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditDialog extends StatelessWidget {
  final BirthdayEvent user;

  const EditDialog({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.edit_contact)),
      body: SafeArea(child: EditBody(user: user)),
    );
  }
}

class EditBody extends StatefulWidget {
  final BirthdayEvent user;

  const EditBody({super.key, required this.user});

  @override
  State<EditBody> createState() => _EditBodyState();
}

class _EditBodyState extends State<EditBody> {
  late final TextEditingController nameController;
  late final TextEditingController surnameController;

  DateTime? birthday;

  String get name => [
    nameController.text.trim(),
    surnameController.text.trim(),
  ].where((e) => e.isNotEmpty).join(' ');

  @override
  void initState() {
    super.initState();

    final parts = widget.user.name.split(' ');

    nameController = TextEditingController(text: parts.first);

    surnameController = TextEditingController(
      text: parts.length > 1 ? parts.sublist(1).join(' ') : '',
    );

    birthday = widget.user.date;

    nameController.addListener(_refresh);
    surnameController.addListener(_refresh);
  }

  void _refresh() {
    setState(() {});
  }

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDate: birthday ?? DateTime.now(),
    );

    if (date != null) {
      setState(() {
        birthday = date;
      });
    }
  }

  Future<bool> confirmEdit() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.edit),
          content: Text(
            AppLocalizations.of(context)!.edit_contact_confirmation(name),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(AppLocalizations.of(context)!.edit),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Bubit, BirthdayState>(
      listenWhen: (p, c) => p.editStatus != c.editStatus,

      listener: (context, state) {
        if (state.editStatus == ActionStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.edited)),
          );

          Navigator.pop(context);
        }
      },

      builder: (context, state) {
        if (state.editStatus == ActionStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(
                    context,
                  )!.add_contact_name_label,
                  border: const OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: surnameController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(
                    context,
                  )!.add_contact_lastname_label,
                  border: const OutlineInputBorder(),
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
                    border: const OutlineInputBorder(),
                  ),
                  child: Text(
                    "${birthday!.day}.${birthday!.month}.${birthday!.year}",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: birthday == null || name.isEmpty
                      ? null
                      : () async {
                          final confirmed = await confirmEdit();

                          if (!confirmed) return;

                          if (!context.mounted) return;

                          context.read<Bubit>().edit(
                            widget.user,
                            summary: name,
                            date: birthday!,
                          );
                        },
                  child: Text(AppLocalizations.of(context)!.edit),
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
