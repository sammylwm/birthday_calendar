import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:equatable/equatable.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:talker_flutter/talker_flutter.dart';

part "state.dart";

String trimLastWords(String input, {int count = 3}) {
  final parts = input.trim().split(RegExp(r'\s+'));

  if (parts.length <= count) return input;

  return parts.sublist(0, parts.length - count).join(' ');
}

DateTime _nextOccurrence(DateTime birthday, DateTime now) {
  final currentYearDate = DateTime(now.year, birthday.month, birthday.day);

  if (!currentYearDate.isBefore(now)) {
    return currentYearDate;
  }

  return DateTime(now.year + 1, birthday.month, birthday.day);
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading()) {
    _getList();
  }

  Future<void> _getList() async {
    try {
      final auth = await GetIt.I<GoogleSignIn>().authorizationClient
          .authorizationForScopes([CalendarApi.calendarReadonlyScope]);

      final client = auth!.authClient(
        scopes: [CalendarApi.calendarReadonlyScope],
      );
      final api = CalendarApi(client);
      final events = await api.events.list("primary", eventTypes: ['birthday']);
      final birthdays =
          events.items?.where((e) => e.start?.date != null).map((e) {
            final date = e.start!.date!;

            return BirthdayEvent(
              id: e.id ?? "",
              name: trimLastWords(e.summary ?? "No name"),
              date: DateTime.parse(date.toString()),
            );
          }).toList() ??
          [];
      if (birthdays.isEmpty) {
        emit(HomeEmpty());
      } else {
        birthdays.sort((a, b) {
          final aKey = (a.date.month, a.date.day);
          final bKey = (b.date.month, b.date.day);

          if (aKey.$1 != bKey.$1) return aKey.$1.compareTo(bKey.$1);
          return aKey.$2.compareTo(bKey.$2);
        });

        final now = DateTime.now();

        final next = birthdays.reduce((a, b) {
          final aNext = _nextOccurrence(a.date, now);
          final bNext = _nextOccurrence(b.date, now);

          final aDiff = aNext.difference(now).inDays;
          final bDiff = bNext.difference(now).inDays;

          return aDiff <= bDiff ? a : b;
        });
        final inMonth = birthdays.where((b) {
          return b.date.month == DateTime.now().month;
        }).toList();

        emit(HomeLoaded(next: next, inMonth: inMonth));
      }
    } catch (e) {
      GetIt.I<Talker>().handle(e.toString());
      emit(HomeError(e.toString()));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
