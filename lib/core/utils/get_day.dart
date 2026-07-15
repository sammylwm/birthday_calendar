import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

String getMonthNominativus(BuildContext context, DateTime date) {
  final l10n = AppLocalizations.of(context)!;

  final months = [
    l10n.months_nominative_1,
    l10n.months_nominative_2,
    l10n.months_nominative_3,
    l10n.months_nominative_4,
    l10n.months_nominative_5,
    l10n.months_nominative_6,
    l10n.months_nominative_7,
    l10n.months_nominative_8,
    l10n.months_nominative_9,
    l10n.months_nominative_10,
    l10n.months_nominative_11,
    l10n.months_nominative_12,
  ];

  final month = months[date.month - 1];

  return month;
}

String getMonthGenetivus(BuildContext context, DateTime date) {
  final l10n = AppLocalizations.of(context)!;

  final months = [
    l10n.months_genitive_1,
    l10n.months_genitive_2,
    l10n.months_genitive_3,
    l10n.months_genitive_4,
    l10n.months_genitive_5,
    l10n.months_genitive_6,
    l10n.months_genitive_7,
    l10n.months_genitive_8,
    l10n.months_genitive_9,
    l10n.months_genitive_10,
    l10n.months_genitive_11,
    l10n.months_genitive_12,
  ];

  final month = months[date.month - 1];

  return month;
}
