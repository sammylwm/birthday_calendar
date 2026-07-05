import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';

class CalendarScreen extends StatefulWidget {
  final GoogleSignInAccount user;

  const CalendarScreen({super.key, required this.user});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  String status = "Loading...";

  @override
  void initState() {
    super.initState();
    loadCalendar();
  }

  Future<void> loadCalendar() async {
    final auth = await widget.user.authorizationClient.authorizationForScopes([
      CalendarApi.calendarReadonlyScope,
    ]);

    final client = auth!.authClient(
      scopes: [CalendarApi.calendarReadonlyScope],
    );

    final api = CalendarApi(client);

    final events = await api.events.list(
      "primary",
      eventTypes: ['birthday'],
    );

    setState(() {
      status = events.items
              ?.map((e) => "${e.summary} - ${e.start?.date}")
              .join("\n") ??
          "No events";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Birthdays")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Text(status),
      ),
    );
  }
}