

  import'package:shared_preferences/shared_preferences.dart';

  class LocalServices {

  static SharedPreferences? prefs ;

  static init() async{
  prefs = await SharedPreferences.getInstance();

  }
  }