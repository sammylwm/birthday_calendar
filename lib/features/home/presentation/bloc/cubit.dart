import 'package:birthday_calendar/core/utils/auth.dart';
import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part "state.dart";

DateTime _nextOccurrence(DateTime birthday, DateTime now) {
  final today = DateTime(now.year, now.month, now.day);

  var next = DateTime(today.year, birthday.month, birthday.day);

  if (next.isBefore(today)) {
    next = DateTime(today.year + 1, birthday.month, birthday.day);
  }

  return next;
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading()) {
    _getList();
  }

  Future<void> _getList() async {
    try {
      final birthdays = await getBirthdays();
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

        final nextDate = birthdays
            .map((b) => _nextOccurrence(b.date, now))
            .reduce((a, b) => a.isBefore(b) ? a : b);

        final next = birthdays.where((b) {
          return _nextOccurrence(b.date, now) == nextDate;
        }).toList();

        final inMonth = birthdays.where((b) {
          return b.date.month == now.month && b.date.day > now.day;
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
