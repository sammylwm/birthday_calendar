// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login_title => 'Birthday\nCalendar';

  @override
  String get login_subtitle =>
      'Never forget\nimportant dates of your loved ones';

  @override
  String get login_google_button => 'Sign in with Google';

  @override
  String get main_title => 'Home';

  @override
  String get main_upcoming_birthday => 'Upcoming birthday';

  @override
  String get main_all_birthdays => 'All birthdays';

  @override
  String get main_this_month => 'This month';

  @override
  String get main_tab_home => 'Home';

  @override
  String get main_tab_all => 'All';

  @override
  String get main_tab_settings => 'Settings';

  @override
  String get all_title => 'All birthdays';

  @override
  String get all_filter_all => 'All';

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_notifications => 'Notifications';

  @override
  String get settings_when_remind => 'When to remind';

  @override
  String get settings_1_day_before => '1 day before';

  @override
  String get settings_remind_time => 'Reminder time';

  @override
  String get settings_repeat_reminder => 'Repeat reminder';

  @override
  String get settings_never => 'Never';

  @override
  String get settings_remind_on_birthday => 'Notify on birthday';

  @override
  String get settings_appearance => 'Appearance';

  @override
  String get settings_theme => 'App theme';

  @override
  String get settings_light_theme => 'Light';

  @override
  String get settings_account_color => 'Account color';

  @override
  String get settings_blue_color => 'Blue';

  @override
  String get settings_other => 'Other';

  @override
  String get settings_about => 'About';

  @override
  String get settings_logout => 'Sign out of Google account';

  @override
  String get add_contact_title => 'Add contact';

  @override
  String get add_contact_name_label => 'First name';

  @override
  String get add_contact_name_placeholder => 'Enter first name';

  @override
  String get add_contact_lastname_label => 'Last name';

  @override
  String get add_contact_lastname_placeholder => 'Enter last name';

  @override
  String get add_contact_birthday_label => 'Birthday';

  @override
  String get add_contact_birthday_placeholder => 'Select date';

  @override
  String get add_contact_notes_label => 'Notes';

  @override
  String get add_contact_notes_placeholder => 'Additional information';

  @override
  String get add_ready => 'Birthday added';

  @override
  String get add => 'Add';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '$count day',
    );
    return '$_temp0';
  }

  @override
  String get common_through => 'in';

  @override
  String get old_years => 'year old';

  @override
  String get birthdays_empty => 'No birthdays yet';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get now => 'Now';

  @override
  String get empty_birthdays_title => 'No birthdays yet';

  @override
  String get empty_birthdays_subtitle =>
      'Add birthdays to Google Calendar to see them here';

  @override
  String get deleted => 'Contact deleted successfully';

  @override
  String get edited => 'Contact edited successfully';

  @override
  String get cancel => 'Cansel';

  @override
  String delete_contact_confirmation(String name) {
    return 'Delete contact \"$name\"?';
  }

  @override
  String edit_contact_confirmation(String name) {
    return 'save contact change for \"$name\"?';
  }

  @override
  String get edit_contact => 'Edit contact';

  @override
  String get exit => 'Exit';

  @override
  String get exit_agree => 'Do you really want to log out of your account?';

  @override
  String get exit_yes => 'Log out';
}
