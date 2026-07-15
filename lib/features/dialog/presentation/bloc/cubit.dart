import 'package:birthday_calendar/core/utils/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;

part "state.dart";

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitial());

  Future add() async {
    try {
      emit(AddLoading());
      final api = await getApi();
      final event = calendar.Event(
        summary: "Dexter Morgan",
        eventType: "birthday",
        transparency: "transparent",
        start: calendar.EventDateTime(date: DateTime(2026, 7, 16)),
        end: calendar.EventDateTime(date: DateTime(2026, 7, 16 + 1)),
        recurrence: ['RRULE:FREQ=YEARLY'],
        visibility: "private",
      );
      await api.events.insert(event, "primary");
      emit(AddLoaded());
    } catch (e) {
      GetIt.I<Talker>().handle(e.toString());
      emit(AddError(e.toString()));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
