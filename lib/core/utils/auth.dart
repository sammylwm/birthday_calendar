import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';

String trimLastWords(String input, {int count = 3}) {
  final parts = input.trim().split(RegExp(r'\s+'));

  if (parts.length <= count) return input;

  return parts.sublist(0, parts.length - count).join(' ');
}

Future<GoogleSignInClientAuthorization> getAuth() async {
  final google = GetIt.I<GoogleSignIn>();

  var auth = await google.authorizationClient.authorizationForScopes([
    CalendarApi.calendarEventsScope,
  ]);

  if (auth != null) {
    return auth;
  }

  auth = await google.authorizationClient.authorizeScopes([
    CalendarApi.calendarEventsScope,
  ]);

  return auth;
}

Future<CalendarApi> getApi() async {
  final auth = await getAuth();

  final client = auth.authClient(
    scopes: [
      CalendarApi.calendarReadonlyScope,
      CalendarApi.calendarEventsScope,
    ],
  );

  return CalendarApi(client);
}

Future<List<BirthdayEvent>> getBirthdays() async {
  final api = await getApi();
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

  return birthdays;
}
