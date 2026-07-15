int daysUntilDate(DateTime targetDate, {DateTime? now}) {
  final today = now ?? DateTime.now();

  final current = DateTime(today.year, today.month, today.day);

  DateTime next = DateTime(current.year, targetDate.month, targetDate.day);

  if (next.isBefore(current)) {
    next = DateTime(current.year + 1, targetDate.month, targetDate.day);
  }

  return next.difference(current).inDays;
}
