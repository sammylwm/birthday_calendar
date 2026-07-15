int calculateAge(DateTime birthDate, {DateTime? today}) {
  final now = today ?? DateTime.now();

  int age = now.year - birthDate.year;

  final hasHadBirthdayThisYear =
      (now.month > birthDate.month) ||
      (now.month == birthDate.month && now.day >= birthDate.day);

  if (!hasHadBirthdayThisYear) {
    age--;
  }

  return age;
}
