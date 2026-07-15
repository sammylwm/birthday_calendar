import 'package:birthday_calendar/core/utils/auth.dart';
import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part "state.dart";

class AllCubit extends Cubit<AllState> {
  AllCubit() : super(AllLoading()) {
    _getList();
  }

  Future _getList() async {
    try {
      final birthdays = await getBirthdays();
      if (birthdays.isEmpty) {
        emit(AllEmpty());
        return;
      }
      Map<int, List<BirthdayEvent>> events = {};
      for (final event in birthdays) {
        events[event.date.month] ??= [];
        events[event.date.month]!.add(event);
      }
      final res = Map.fromEntries(
        events.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
      );
      emit(AllLoaded(res));
    } catch (e) {
      GetIt.I<Talker>().handle(e.toString());
      emit(AllError(e.toString()));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
