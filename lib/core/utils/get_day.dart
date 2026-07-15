import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getMonthNominativus(BuildContext context, int month) {
  final locale = Localizations.localeOf(context).languageCode;
  String res = DateFormat(
    'LLLL',
    locale,
  ).format(DateTime(2026, month, 1)).trim();
  return res;
}

String getMonthGenetivus(BuildContext context, int month, int date) {
  final locale = Localizations.localeOf(context).languageCode;
  String res = DateFormat(
    '$date MMMM',
    locale,
  ).format(DateTime(2026, month, 1)).trim();
  return res;
}
