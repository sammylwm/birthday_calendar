import 'package:birthday_calendar/features/home/domain/birthday_model.dart';

List<BirthdayEvent> getNext(List<BirthdayEvent> birthdays) {
  final now = DateTime.now();
  final nextDate = birthdays
      .map((b) => _nextOccurrence(b.date, now))
      .reduce((a, b) => a.isBefore(b) ? a : b);

  final next = birthdays.where((b) {
    final date = _nextOccurrence(b.date, now);

    return date.year == nextDate.year &&
        date.month == nextDate.month &&
        date.day == nextDate.day;
  }).toList();
  return next;
}

Map<int, List<BirthdayEvent>> groupByMonth(List<BirthdayEvent> birthdays) {
  Map<int, List<BirthdayEvent>> events = {};
  for (final event in birthdays) {
    events[event.date.month] ??= [];
    events[event.date.month]!.add(event);
  }
  final res = Map.fromEntries(
    events.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
  );
  return res;
}

List<BirthdayEvent> getThisMonth(List<BirthdayEvent> birthdays) {
  final now = DateTime.now();
  final inMonth = birthdays.where((b) {
    return b.date.month == now.month;
  }).toList();
  return inMonth;
}

DateTime _nextOccurrence(DateTime birthday, DateTime now) {
  final today = DateTime(now.year, now.month, now.day);

  var next = DateTime(today.year, birthday.month, birthday.day);

  if (next.isBefore(today)) {
    next = DateTime(today.year + 1, birthday.month, birthday.day);
  }

  return next;
}
