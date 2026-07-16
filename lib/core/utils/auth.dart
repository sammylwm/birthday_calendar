import 'package:birthday_calendar/features/home/domain/birthday_model.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';

String getBirthdayName(String summary) {
  return summary.replaceFirst("🎂 Happy Birthday ", "");
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

  final events = await api.events.list("primary");

  final birthdays =
      events.items
          ?.where(
            (e) =>
                e.extendedProperties?.private?["app"] == "birthday_calendar" &&
                e.extendedProperties?.private?["type"] == "birthday",
          )
          .map((e) {
            final start = e.start;

            final date = start?.date ?? start?.dateTime;

            if (date == null) {
              return null;
            }

            return BirthdayEvent(
              id: e.id ?? "",
              name: getBirthdayName(e.summary ?? ""),
              date: DateTime(date.year, date.month, date.day),
            );
          })
          .whereType<BirthdayEvent>()
          .toList() ??
      [];

  return birthdays;
}
