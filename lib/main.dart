import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'app.dart';

void main() async {
  await initializeDateFormatting('ru', null);
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;
  await googleSignIn.initialize(
    serverClientId:
        "611671590619-8mbjaqesr8hf6idg9ifmlet0qivhuu95.apps.googleusercontent.com",
  );

  GetIt.I.registerSingleton(googleSignIn);
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: TalkerBlocLoggerSettings(
      printChanges: true,
      printStateFullData: true,
      printEventFullData: true,
    ),
  );

  FlutterError.onError = (details) =>
      GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(
    () => runApp(const MyApp()),
    (error, stack) => GetIt.I<Talker>().handle(error, stack),
  );
}
