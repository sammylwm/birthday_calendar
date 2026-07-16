import 'package:birthday_calendar/core/utils/auth.dart';
import 'package:birthday_calendar/core/utils/get_next.dart';
import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:talker_flutter/talker_flutter.dart';

part "state.dart";

class Bubit extends Cubit<BirthdayState> {
  final GoogleSignIn googleSignIn = GetIt.I<GoogleSignIn>();
  Bubit() : super(BirthdayState());

  Future login() async {
    emit(state.copyWith(authStatus: AuthStatus.loading, error: null));
    try {
      final user = await googleSignIn.authenticate();
      if (user.authentication.idToken != null) {
        emit(state.copyWith(authStatus: AuthStatus.authenticated));
      } else {
        emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
      }
    } catch (e, st) {
      onError(e, st);

      emit(
        state.copyWith(
          authStatus: AuthStatus.unauthenticated,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> checkLogin() async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    final user = await googleSignIn.attemptLightweightAuthentication();

    if (user != null) {
      emit(state.copyWith(authStatus: AuthStatus.authenticated));
    } else {
      emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
    }
  }

  Future<void> getAll() async {
    emit(state.copyWith(loading: true, error: null));

    try {
      final birthdays = await getBirthdays();
      if (birthdays.isEmpty) {
        emit(state.copyWith(events: {}, loading: false, next: [], inMonth: []));
        return;
      }
      birthdays.sort((a, b) {
        final aKey = (a.date.month, a.date.day);
        final bKey = (b.date.month, b.date.day);

        if (aKey.$1 != bKey.$1) return aKey.$1.compareTo(bKey.$1);
        return aKey.$2.compareTo(bKey.$2);
      });

      final next = getNext(birthdays);
      final events = groupByMonth(birthdays);

      emit(
        state.copyWith(
          loading: false,
          next: next,
          events: events,
          inMonth: getThisMonth(birthdays),
        ),
      );
    } catch (e, st) {
      onError(e, st);

      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  Future add(String summary, DateTime date) async {
    try {
      emit(state.copyWith(addStatus: ActionStatus.loading, error: null));
      final api = await getApi();
      final event = calendar.Event(
        summary: summary,
        eventType: "birthday",
        transparency: "transparent",
        start: calendar.EventDateTime(date: date),
        end: calendar.EventDateTime(
          date: DateTime(date.year, date.month, date.day + 1),
        ),
        recurrence: ['RRULE:FREQ=YEARLY'],
        visibility: "private",
      );
      await api.events.insert(event, "primary");
      emit(state.copyWith(addStatus: ActionStatus.success));
      getAll();
    } catch (e, st) {
      onError(e, st);

      emit(
        state.copyWith(addStatus: ActionStatus.failure, error: e.toString()),
      );
    }
  }

  Future delete(String eventId) async {
    try {
      emit(state.copyWith(deleteStatus: ActionStatus.loading, error: null));
      final api = await getApi();
      await api.events.delete("primary", eventId);
      emit(state.copyWith(deleteStatus: ActionStatus.success));
      getAll();
    } catch (e, st) {
      onError(e, st);
      emit(
        state.copyWith(deleteStatus: ActionStatus.failure, error: e.toString()),
      );
    }
  }

  Future<void> edit(
    BirthdayEvent event, {
    required String summary,
    required DateTime date,
  }) async {
    try {
      emit(state.copyWith(error: null, editStatus: ActionStatus.loading));

      final api = await getApi();

      final updatedEvent = calendar.Event(
        summary: summary,
        eventType: "birthday",
        transparency: "transparent",
        start: calendar.EventDateTime(date: date),
        end: calendar.EventDateTime(
          date: DateTime(date.year, date.month, date.day + 1),
        ),
        recurrence: ['RRULE:FREQ=YEARLY'],
        visibility: "private",
      );

      await api.events.update(updatedEvent, "primary", event.id);

      emit(state.copyWith(editStatus: ActionStatus.success));

      await getAll();
    } catch (e, st) {
      onError(e, st);

      emit(
        state.copyWith(editStatus: ActionStatus.failure, error: e.toString()),
      );
    }
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
