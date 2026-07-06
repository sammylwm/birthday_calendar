import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @login_title.
  ///
  /// In en, this message translates to:
  /// **'Birthday\nCalendar'**
  String get login_title;

  /// No description provided for @login_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Never forget\nimportant dates of your loved ones'**
  String get login_subtitle;

  /// No description provided for @login_google_button.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get login_google_button;

  /// No description provided for @main_title.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get main_title;

  /// No description provided for @main_upcoming_birthday.
  ///
  /// In en, this message translates to:
  /// **'Upcoming birthday'**
  String get main_upcoming_birthday;

  /// No description provided for @main_all_birthdays.
  ///
  /// In en, this message translates to:
  /// **'All birthdays'**
  String get main_all_birthdays;

  /// No description provided for @main_this_month.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get main_this_month;

  /// No description provided for @main_tab_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get main_tab_home;

  /// No description provided for @main_tab_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get main_tab_all;

  /// No description provided for @main_tab_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get main_tab_settings;

  /// No description provided for @all_title.
  ///
  /// In en, this message translates to:
  /// **'All birthdays'**
  String get all_title;

  /// No description provided for @all_filter_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all_filter_all;

  /// No description provided for @settings_title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_title;

  /// No description provided for @settings_notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settings_notifications;

  /// No description provided for @settings_when_remind.
  ///
  /// In en, this message translates to:
  /// **'When to remind'**
  String get settings_when_remind;

  /// No description provided for @settings_1_day_before.
  ///
  /// In en, this message translates to:
  /// **'1 day before'**
  String get settings_1_day_before;

  /// No description provided for @settings_remind_time.
  ///
  /// In en, this message translates to:
  /// **'Reminder time'**
  String get settings_remind_time;

  /// No description provided for @settings_repeat_reminder.
  ///
  /// In en, this message translates to:
  /// **'Repeat reminder'**
  String get settings_repeat_reminder;

  /// No description provided for @settings_never.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get settings_never;

  /// No description provided for @settings_remind_on_birthday.
  ///
  /// In en, this message translates to:
  /// **'Notify on birthday'**
  String get settings_remind_on_birthday;

  /// No description provided for @settings_appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settings_appearance;

  /// No description provided for @settings_theme.
  ///
  /// In en, this message translates to:
  /// **'App theme'**
  String get settings_theme;

  /// No description provided for @settings_light_theme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settings_light_theme;

  /// No description provided for @settings_account_color.
  ///
  /// In en, this message translates to:
  /// **'Account color'**
  String get settings_account_color;

  /// No description provided for @settings_blue_color.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get settings_blue_color;

  /// No description provided for @settings_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get settings_other;

  /// No description provided for @settings_backup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get settings_backup;

  /// No description provided for @settings_google_drive.
  ///
  /// In en, this message translates to:
  /// **'Google Drive'**
  String get settings_google_drive;

  /// No description provided for @settings_about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settings_about;

  /// No description provided for @settings_logout.
  ///
  /// In en, this message translates to:
  /// **'Sign out of Google account'**
  String get settings_logout;

  /// No description provided for @add_contact_title.
  ///
  /// In en, this message translates to:
  /// **'Add contact'**
  String get add_contact_title;

  /// No description provided for @add_contact_name_label.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get add_contact_name_label;

  /// No description provided for @add_contact_name_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter first name'**
  String get add_contact_name_placeholder;

  /// No description provided for @add_contact_lastname_label.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get add_contact_lastname_label;

  /// No description provided for @add_contact_lastname_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter last name'**
  String get add_contact_lastname_placeholder;

  /// No description provided for @add_contact_birthday_label.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get add_contact_birthday_label;

  /// No description provided for @add_contact_birthday_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get add_contact_birthday_placeholder;

  /// No description provided for @add_contact_notes_label.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get add_contact_notes_label;

  /// No description provided for @add_contact_notes_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Additional information'**
  String get add_contact_notes_placeholder;

  /// No description provided for @months_nominative_1.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get months_nominative_1;

  /// No description provided for @months_nominative_2.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get months_nominative_2;

  /// No description provided for @months_nominative_3.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get months_nominative_3;

  /// No description provided for @months_nominative_4.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get months_nominative_4;

  /// No description provided for @months_nominative_5.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get months_nominative_5;

  /// No description provided for @months_nominative_6.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get months_nominative_6;

  /// No description provided for @months_nominative_7.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get months_nominative_7;

  /// No description provided for @months_nominative_8.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get months_nominative_8;

  /// No description provided for @months_nominative_9.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get months_nominative_9;

  /// No description provided for @months_nominative_10.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get months_nominative_10;

  /// No description provided for @months_nominative_11.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get months_nominative_11;

  /// No description provided for @months_nominative_12.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get months_nominative_12;

  /// No description provided for @months_genitive_1.
  ///
  /// In en, this message translates to:
  /// **'of January'**
  String get months_genitive_1;

  /// No description provided for @months_genitive_2.
  ///
  /// In en, this message translates to:
  /// **'of February'**
  String get months_genitive_2;

  /// No description provided for @months_genitive_3.
  ///
  /// In en, this message translates to:
  /// **'of March'**
  String get months_genitive_3;

  /// No description provided for @months_genitive_4.
  ///
  /// In en, this message translates to:
  /// **'of April'**
  String get months_genitive_4;

  /// No description provided for @months_genitive_5.
  ///
  /// In en, this message translates to:
  /// **'of May'**
  String get months_genitive_5;

  /// No description provided for @months_genitive_6.
  ///
  /// In en, this message translates to:
  /// **'of June'**
  String get months_genitive_6;

  /// No description provided for @months_genitive_7.
  ///
  /// In en, this message translates to:
  /// **'of July'**
  String get months_genitive_7;

  /// No description provided for @months_genitive_8.
  ///
  /// In en, this message translates to:
  /// **'of August'**
  String get months_genitive_8;

  /// No description provided for @months_genitive_9.
  ///
  /// In en, this message translates to:
  /// **'of September'**
  String get months_genitive_9;

  /// No description provided for @months_genitive_10.
  ///
  /// In en, this message translates to:
  /// **'of October'**
  String get months_genitive_10;

  /// No description provided for @months_genitive_11.
  ///
  /// In en, this message translates to:
  /// **'of November'**
  String get months_genitive_11;

  /// No description provided for @months_genitive_12.
  ///
  /// In en, this message translates to:
  /// **'of December'**
  String get months_genitive_12;

  /// No description provided for @through_day.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get through_day;

  /// No description provided for @common_through.
  ///
  /// In en, this message translates to:
  /// **'in'**
  String get common_through;

  /// No description provided for @old_years.
  ///
  /// In en, this message translates to:
  /// **'year old'**
  String get old_years;

  /// No description provided for @birthdays_empty.
  ///
  /// In en, this message translates to:
  /// **'No birthdays yet'**
  String get birthdays_empty;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
