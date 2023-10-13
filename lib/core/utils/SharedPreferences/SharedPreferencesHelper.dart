import 'SharedPreferencesProvider.dart';


class AppSharedPreferences {

  static const KEY_LANG = "PREF_KEY_LANG";
  static const KEY_ALLOW_NOTIFICATION = "PREF_KEY_ALLOW_NOTIFICATION";
  static const KEY_DARK_MODE= "PREF_KEY_DARK_MODE";


  static SharedPreferencesProvider? _pref;

  static init() async {
    _pref = await SharedPreferencesProvider.getInstance();
  }

  static clear() {
    _pref!.clear();
  }

  //language
  static String? get lang => _pref!.read(KEY_LANG);

  static set lang(String? lang) => _pref!.save(KEY_LANG, lang);

  //allow notification
  static bool? get allowNotification => _pref!.read(KEY_ALLOW_NOTIFICATION);

  static set allowNotification(bool? allow) => _pref!.save(KEY_ALLOW_NOTIFICATION, allow);

  //dark mode
  static bool? get darkMode => _pref!.read(KEY_DARK_MODE);

  static set darkMode(bool? darkMode) => _pref!.save(KEY_DARK_MODE, darkMode);




}
