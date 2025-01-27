import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider
{

  static late SharedPreferences sharedPreferences;

  static  SharedPreferencesProvider? _singleton ;
  static Future<SharedPreferencesProvider?> getInstance()async
  {
    if( _singleton == null )
    {
      sharedPreferences = await SharedPreferences.getInstance();
      return _singleton =  SharedPreferencesProvider();
    }
    return _singleton;
  }

  SharedPreferencesProvider()
  {
   // _init(  ) ;
  }
  _init(  ) async {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  read(String key) {
    return contains(key)? json.decode(sharedPreferences.getString(key)!) : null;
  }

  save(String key, value) {

    sharedPreferences.setString(key, json.encode(value));
  }

  saveBoolean(String key,bool value)
  {
    sharedPreferences. setBool (key,value);
  }
  bool? readBoolean(String key) {
    return contains(key)? sharedPreferences.getBool(key) : null;
  }

  contains(String key) {

    return sharedPreferences.containsKey(key);
  }

  remove(String key) {
    sharedPreferences.remove(key);
  }

  clear() {
    sharedPreferences.clear();
  }

}
