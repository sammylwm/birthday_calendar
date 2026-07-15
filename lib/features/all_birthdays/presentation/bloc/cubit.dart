import 'package:birthday_calendar/core/utils/auth.dart';
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
