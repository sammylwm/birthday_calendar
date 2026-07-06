import 'package:equatable/equatable.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:talker_flutter/talker_flutter.dart';

part "state.dart";

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
      emit(HomeLoaded(events: events.items));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
