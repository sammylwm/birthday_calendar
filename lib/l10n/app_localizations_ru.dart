// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get login_title => 'Календарь\nдней рождений';

  @override
  String get login_subtitle =>
      'Никогда не забывайте\nважные даты близких людей';

  @override
  String get login_google_button => 'Войти через Google';

  @override
  String get main_title => 'Главная';

  @override
  String get main_upcoming_birthday => 'Ближайший день рождения';

  @override
  String get main_all_birthdays => 'Все дни рождения';

  @override
  String get main_this_month => 'В этом месяце';

  @override
  String get main_tab_home => 'Главная';

  @override
  String get main_tab_all => 'Все';

  @override
  String get main_tab_settings => 'Настройки';

  @override
  String get all_title => 'Все дни рождения';

  @override
  String get all_filter_all => 'Все';

  @override
  String get settings_title => 'Настройки';

  @override
  String get settings_notifications => 'Уведомления';

  @override
  String get settings_when_remind => 'Когда уведомлять';

  @override
  String get settings_1_day_before => 'За 1 день';

  @override
  String get settings_remind_time => 'Время уведомления';

  @override
  String get settings_repeat_reminder => 'Повторять уведомление';

  @override
  String get settings_never => 'Никогда';

  @override
  String get settings_remind_on_birthday => 'Уведомлять в день рождения';

  @override
  String get settings_appearance => 'Внешний вид';

  @override
  String get settings_theme => 'Тема приложения';

  @override
  String get settings_light_theme => 'Светлая';

  @override
  String get settings_account_color => 'Цвет аккаунта';

  @override
  String get settings_blue_color => 'Синий';

  @override
  String get settings_other => 'Другое';

  @override
  String get settings_about => 'О приложении';

  @override
  String get settings_logout => 'Выйти из аккаунта Google';

  @override
  String get add_contact_title => 'Добавление контакта';

  @override
  String get add_contact_name_label => 'Имя';

  @override
  String get add_contact_name_placeholder => 'Введите имя';

  @override
  String get add_contact_lastname_label => 'Фамилия';

  @override
  String get add_contact_lastname_placeholder => 'Введите фамилию';

  @override
  String get add_contact_birthday_label => 'Дата рождения';

  @override
  String get add_contact_birthday_placeholder => 'Выберите дату';

  @override
  String get add_contact_notes_label => 'Заметки';

  @override
  String get add_contact_notes_placeholder => 'Дополнительная информация';

  @override
  String get add_ready => 'День рождения добавлен';

  @override
  String get add => 'Добавить';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня',
      many: '$count дней',
      few: '$count дня',
      one: '$count день',
    );
    return '$_temp0';
  }

  @override
  String get common_through => 'через';

  @override
  String get old_years => 'лет';

  @override
  String get birthdays_empty => 'В близайшее время без праздников';

  @override
  String get edit => 'Изменить';

  @override
  String get delete => 'Удалить';

  @override
  String get now => 'Сегодня';

  @override
  String get empty_birthdays_title => 'Пока нет дней рождения';

  @override
  String get empty_birthdays_subtitle =>
      'Добавьте дни рождения в Google Календарь, чтобы увидеть их здесь';

  @override
  String get deleted => 'Контакт успешно удалён';

  @override
  String get edited => 'Контакт успешно изменён';

  @override
  String get cancel => 'Отмена';

  @override
  String delete_contact_confirmation(String name) {
    return 'Удалить контакт \"$name\"?';
  }

  @override
  String edit_contact_confirmation(String name) {
    return 'Сохранить изменения контакта \"$name\"?';
  }

  @override
  String get edit_contact => 'Изменение контакта';

  @override
  String get exit => 'Выход';

  @override
  String get exit_agree => 'Вы действительно хотите выйти из аккаунта?';

  @override
  String get exit_yes => 'Выйти';
}
